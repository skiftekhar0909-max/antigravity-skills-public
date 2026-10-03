<#
.SYNOPSIS
    Installs Antigravity skills into a local workspace or global configuration directory.

.DESCRIPTION
    Cross-platform PowerShell installer for the Antigravity Skills Toolkit.
    Discovers available skills dynamically from the repository's `skills/` folder
    and copies them to either a project workspace (.agents/skills) or the user's
    global Antigravity configuration directory (~/.gemini/config/skills).

    Does NOT require Bash, Git Bash, or WSL. Runs natively on Windows PowerShell 5.1+
    and PowerShell 7+ on Windows, macOS, and Linux.

.PARAMETER All
    Installs all discovered skills (default behavior if no specific skill is named).

.PARAMETER Skill
    Name of one or more specific skills to install (e.g., -Skill uiux-design-engine).

.PARAMETER Global
    Installs skills globally to the user profile directory:
    Windows: $HOME\.gemini\config\skills
    Linux/macOS: ~/.gemini/config/skills

.PARAMETER Workspace
    Installs skills into the current project workspace directory:
    .\.agents\skills (default if -Global or -Target is not specified).

.PARAMETER Target
    Custom destination directory for the installed skills.

.PARAMETER Force
    Overwrites existing skill files without prompting.

.PARAMETER DryRun
    Simulates the installation process without creating directories or copying files.
    Also accepts standard PowerShell -WhatIf.

.PARAMETER List
    Lists all available skills discovered in this repository and exits.

.EXAMPLE
    # Install all skills into the current workspace (.agents/skills)
    .\scripts\install.ps1

.EXAMPLE
    # Install all skills globally
    .\scripts\install.ps1 -Global

.EXAMPLE
    # Install only the UI/UX design engine skill into current workspace
    .\scripts\install.ps1 -Skill uiux-design-engine

.EXAMPLE
    # Preview what would be installed globally without making changes
    .\scripts\install.ps1 -Global -DryRun

.EXAMPLE
    # Overwrite existing skills in a custom target folder
    .\scripts\install.ps1 -Target "D:\MyProject\.agents\skills" -Force
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [switch]$All,
    [string[]]$Skill,
    [switch]$Global,
    [switch]$Workspace,
    [string]$Target,
    [alias("Overwrite")]
    [switch]$Force,
    [alias("WhatIfSwitch")]
    [switch]$DryRun,
    [switch]$List
)

$ErrorActionPreference = "Stop"

if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey("WhatIf")) { $DryRun = $true }

# Helper functions for formatted output
function Write-Success([string]$Message) {
    Write-Host "[+] $Message" -ForegroundColor Green
}
function Write-Info([string]$Message) {
    Write-Host "[*] $Message" -ForegroundColor Cyan
}
function Write-WarnMsg([string]$Message) {
    Write-Host "[!] $Message" -ForegroundColor Yellow
}
function Write-Failure([string]$Message) {
    Write-Host "[-] $Message" -ForegroundColor Red
}

# Resolve repository root and source skills directory relative to this script
$ScriptDirectory = $PSScriptRoot
if (-not $ScriptDirectory) {
    $ScriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
}
$RepoRoot = Split-Path -Parent $ScriptDirectory
$SourceDir = Join-Path $RepoRoot "skills"

if (-not (Test-Path -LiteralPath $SourceDir -PathType Container)) {
    Write-Failure "Skills source directory not found: $SourceDir"
    exit 1
}

# Discover all valid skills dynamically
$DiscoveredSkills = @()
$SkillFolders = Get-ChildItem -LiteralPath $SourceDir -Directory
foreach ($folder in $SkillFolders) {
    $skillFile = Join-Path $folder.FullName "SKILL.md"
    if (Test-Path -LiteralPath $skillFile -PathType Leaf) {
        $DiscoveredSkills += [PSCustomObject]@{
            Name     = $folder.Name
            FullName = $folder.FullName
            File     = $skillFile
        }
    } else {
        Write-WarnMsg "Skipping folder without SKILL.md: $($folder.Name)"
    }
}

if ($DiscoveredSkills.Count -eq 0) {
    Write-Failure "No valid skills with SKILL.md found in: $SourceDir"
    exit 1
}

# Handle -List parameter
if ($List) {
    Write-Host ""
    Write-Host "=== Available Antigravity Skills in Repository ===" -ForegroundColor Cyan
    Write-Host "Discovered in: $SourceDir"
    Write-Host ""
    foreach ($s in $DiscoveredSkills) {
        Write-Host "  * " -NoNewline -ForegroundColor Green
        Write-Host "$($s.Name)" -ForegroundColor White
    }
    Write-Host ""
    Write-Host "To install a skill: .\scripts\install.ps1 -Skill <name>" -ForegroundColor Gray
    exit 0
}

# Determine destination directory
if ($Target) {
    $TargetDir = $Target
    $TargetScope = "Custom ($Target)"
} elseif ($Global) {
    $TargetDir = Join-Path $HOME ".gemini\config\skills"
    $TargetScope = "Global ($TargetDir)"
} else {
    # Default is workspace: .agents/skills in current directory
    $CurrentDir = Get-Location
    $TargetDir = Join-Path $CurrentDir ".agents\skills"
    $TargetScope = "Workspace ($TargetDir)"
}

# Determine which skills to install
$SkillsToInstall = @()
if ($Skill -and $Skill.Count -gt 0) {
    foreach ($requestedName in $Skill) {
        $match = $DiscoveredSkills | Where-Object { $_.Name -eq $requestedName.Trim() }
        if ($match) {
            $SkillsToInstall += $match
        } else {
            Write-Failure "Requested skill '$requestedName' was not found in repository."
            Write-Host "Available skills:" -ForegroundColor Yellow
            foreach ($s in $DiscoveredSkills) {
                Write-Host "  - $($s.Name)"
            }
            exit 1
        }
    }
} else {
    # Default or -All: install all discovered skills
    $SkillsToInstall = $DiscoveredSkills
}

# Banner
Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "          Antigravity Skills Toolkit Installer            " -ForegroundColor White
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Info "Target Scope : $TargetScope"
Write-Info "Destination  : $TargetDir"
if ($DryRun) {
    Write-WarnMsg "MODE         : PREVIEW (DRY-RUN) - No changes will be written"
}
Write-Host ""

# Ensure target root directory exists (unless dry-run)
if (-not $DryRun) {
    if (-not (Test-Path -LiteralPath $TargetDir -PathType Container)) {
        try {
            New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
            Write-Info "Created destination directory: $TargetDir"
        } catch {
            Write-Failure "Failed to create destination directory: $_"
            exit 1
        }
    }
}

$InstalledCount = 0
$SkippedCount = 0

foreach ($skillObj in $SkillsToInstall) {
    $destFolder = Join-Path $TargetDir $skillObj.Name
    $folderExists = Test-Path -LiteralPath $destFolder -PathType Container

    if ($DryRun) {
        if ($folderExists -and -not $Force) {
            Write-Host "[DRY-RUN] Would SKIP '$($skillObj.Name)' (destination already exists, requires -Force to overwrite)" -ForegroundColor Yellow
            $SkippedCount++
        } else {
            $action = if ($folderExists) { "OVERWRITE" } else { "INSTALL" }
            Write-Host "[DRY-RUN] Would $action '$($skillObj.Name)' -> $destFolder" -ForegroundColor Cyan
            $InstalledCount++
        }
        continue
    }

    if ($folderExists -and -not $Force) {
        Write-WarnMsg "Skipped '$($skillObj.Name)': already exists at destination. Use -Force to overwrite."
        $SkippedCount++
        continue
    }

    try {
        if (-not $folderExists) {
            New-Item -ItemType Directory -Path $destFolder -Force | Out-Null
        }

        # Recursively copy all files and subdirectories (e.g. references/)
        Copy-Item -Path (Join-Path $skillObj.FullName "*") -Destination $destFolder -Recurse -Force
        
        Write-Success "Installed '$($skillObj.Name)' -> $destFolder"
        $InstalledCount++
    } catch {
        Write-Failure "Failed to install '$($skillObj.Name)': $_"
        exit 1
    }
}

# Summary Report
Write-Host ""
Write-Host "----------------------------------------------------------" -ForegroundColor Cyan
if ($DryRun) {
    Write-Info "Dry-run complete. Would install: $InstalledCount, Would skip: $SkippedCount"
} else {
    Write-Success "Installation finished. Installed/updated: $InstalledCount, Skipped: $SkippedCount"
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor White
    Write-Host "  1. If Antigravity is open, reload your window or restart the app." -ForegroundColor Gray
    Write-Host "  2. The agent will automatically discover the installed skills." -ForegroundColor Gray
    Write-Host "  3. To verify or trigger, prompt the agent with a skill-related query." -ForegroundColor Gray
    Write-Host "  4. To uninstall at any time: .\scripts\uninstall.ps1" -ForegroundColor Gray
}
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

exit 0
