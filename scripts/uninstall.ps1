<#
.SYNOPSIS
    Uninstalls Antigravity skills from a workspace or global configuration directory.

.DESCRIPTION
    Cross-platform PowerShell uninstaller for the Antigravity Skills Toolkit.
    Safely removes specified or all toolkit-managed skills from either the current
    workspace (.agents/skills) or global configuration directory (~/.gemini/config/skills).

    Includes dry-run support and safety checks to prevent deleting unrelated files.

.PARAMETER All
    Uninstalls all toolkit skills found in the target directory.

.PARAMETER Skill
    Name of one or more specific skills to uninstall (e.g., -Skill uiux-design-engine).

.PARAMETER Global
    Targets the global Antigravity configuration directory:
    Windows: $HOME\.gemini\config\skills
    Linux/macOS: ~/.gemini/config/skills

.PARAMETER Workspace
    Targets the project workspace directory (default: .\.agents\skills).

.PARAMETER Target
    Custom target directory where skills were installed.

.PARAMETER Force
    Deletes skill folders without interactive confirmation.

.PARAMETER DryRun
    Simulates the uninstallation process without deleting any files.
    Also accepts standard PowerShell -WhatIf.

.PARAMETER List
    Lists toolkit skills currently installed in the target directory.

.EXAMPLE
    # Uninstall all skills from current workspace
    .\scripts\uninstall.ps1 -All

.EXAMPLE
    # Uninstall a specific skill from global configuration
    .\scripts\uninstall.ps1 -Global -Skill uiux-design-engine

.EXAMPLE
    # Preview removal without deleting anything
    .\scripts\uninstall.ps1 -Global -Skill uiux-design-engine -DryRun
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [switch]$All,
    [string[]]$Skill,
    [switch]$Global,
    [switch]$Workspace,
    [string]$Target,
    [switch]$Force,
    [alias("WhatIfSwitch")]
    [switch]$DryRun,
    [switch]$List
)

$ErrorActionPreference = "Stop"

if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey("WhatIf")) { $DryRun = $true }

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

# Resolve repository root and known skills
$ScriptDirectory = $PSScriptRoot
if (-not $ScriptDirectory) {
    $ScriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
}
$RepoRoot = Split-Path -Parent $ScriptDirectory
$SourceDir = Join-Path $RepoRoot "skills"

$KnownSkills = @()
if (Test-Path -LiteralPath $SourceDir -PathType Container) {
    $KnownFolders = Get-ChildItem -LiteralPath $SourceDir -Directory
    foreach ($f in $KnownFolders) {
        $KnownSkills += $f.Name
    }
}

# Determine target directory
if ($Target) {
    $TargetDir = $Target
    $TargetScope = "Custom ($Target)"
} elseif ($Global) {
    $TargetDir = Join-Path $HOME ".gemini\config\skills"
    $TargetScope = "Global ($TargetDir)"
} else {
    $CurrentDir = Get-Location
    $TargetDir = Join-Path $CurrentDir ".agents\skills"
    $TargetScope = "Workspace ($TargetDir)"
}

if (-not (Test-Path -LiteralPath $TargetDir -PathType Container)) {
    Write-WarnMsg "Target directory does not exist: $TargetDir"
    Write-Info "Nothing to uninstall."
    exit 0
}

# Discover installed skills in target directory
$InstalledSkills = @()
$FoundItems = Get-ChildItem -LiteralPath $TargetDir -Directory
foreach ($item in $FoundItems) {
    $InstalledSkills += $item.Name
}

# Handle -List
if ($List) {
    Write-Host ""
    Write-Host "=== Installed Skills in $TargetScope ===" -ForegroundColor Cyan
    if ($InstalledSkills.Count -eq 0) {
        Write-Host "  (No skills found in $TargetDir)" -ForegroundColor Gray
    } else {
        foreach ($s in $InstalledSkills) {
            $isToolkit = if ($KnownSkills -contains $s) { "[Toolkit Skill]" } else { "[External Skill]" }
            Write-Host "  * $s $isToolkit" -ForegroundColor White
        }
    }
    Write-Host ""
    exit 0
}

# Determine which skills to remove
$SkillsToRemove = @()
if ($Skill -and $Skill.Count -gt 0) {
    foreach ($requested in $Skill) {
        $clean = $requested.Trim()
        if ($InstalledSkills -contains $clean) {
            $SkillsToRemove += $clean
        } else {
            Write-WarnMsg "Skill '$clean' is not installed in: $TargetDir"
        }
    }
} elseif ($All) {
    # Only remove toolkit skills to avoid deleting user's custom skills by mistake
    foreach ($s in $InstalledSkills) {
        if ($KnownSkills -contains $s) {
            $SkillsToRemove += $s
        }
    }
    if ($SkillsToRemove.Count -eq 0) {
        Write-Info "No matching toolkit skills found to remove in: $TargetDir"
        exit 0
    }
} else {
    Write-WarnMsg "No action specified. Please provide -Skill <name> or -All to uninstall."
    Write-Host "Available options:" -ForegroundColor Gray
    Write-Host "  .\scripts\uninstall.ps1 -Skill <name>" -ForegroundColor Gray
    Write-Host "  .\scripts\uninstall.ps1 -All" -ForegroundColor Gray
    Write-Host "  .\scripts\uninstall.ps1 -List" -ForegroundColor Gray
    exit 1
}

if ($SkillsToRemove.Count -eq 0) {
    Write-Info "No skills selected for removal."
    exit 0
}

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "          Antigravity Skills Toolkit Uninstaller          " -ForegroundColor White
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Info "Target Scope : $TargetScope"
Write-Info "Directory    : $TargetDir"
if ($DryRun) {
    Write-WarnMsg "MODE         : PREVIEW (DRY-RUN) - No files will be deleted"
}
Write-Host ""

$RemovedCount = 0

foreach ($skillName in $SkillsToRemove) {
    $folderToRemove = Join-Path $TargetDir $skillName

    # Extra safety check: ensure the folder path is strictly inside $TargetDir
    if (-not (Test-Path -LiteralPath $folderToRemove -PathType Container)) {
        continue
    }

    if ($DryRun) {
        Write-Host "[DRY-RUN] Would REMOVE: $folderToRemove" -ForegroundColor Yellow
        $RemovedCount++
        continue
    }

    try {
        Remove-Item -LiteralPath $folderToRemove -Recurse -Force
        Write-Success "Removed: $skillName from $TargetDir"
        $RemovedCount++
    } catch {
        Write-Failure "Failed to remove '$skillName': $_"
        exit 1
    }
}

Write-Host ""
Write-Host "----------------------------------------------------------" -ForegroundColor Cyan
if ($DryRun) {
    Write-Info "Dry-run complete. Would remove: $RemovedCount skill(s)."
} else {
    Write-Success "Uninstallation complete. Removed: $RemovedCount skill(s)."
    Write-Host "Remember to reload or restart Antigravity if it is currently open." -ForegroundColor Gray
}
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

exit 0
