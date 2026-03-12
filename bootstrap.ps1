param (
    [Parameter(Mandatory=$true, HelpMessage="Enter the target GitHub Organization Name (e.g., 'acmewidgets')")]
    [string]$OrganizationName,

    [Parameter(Mandatory=$false, HelpMessage="Set repository visibility: 'public', 'private', or 'internal'")]
    [ValidateSet("public", "private", "internal")]
    [string]$Visibility = "private"
)

$RepoName = "antigravity-dev-system"

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host " Antigravity AI CTO - GitHub Org Bootstrapper" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Target Organization: $OrganizationName"
Write-Host "Target Repository:   $RepoName"
Write-Host "Visibility:          $Visibility"
Write-Host ""

# 1. Verify gh cli is installed
if (!(Get-Command "gh" -ErrorAction SilentlyContinue)) {
    Write-Error "GitHub CLI (gh) is not installed. Please install it from https://cli.github.com/ and 'gh auth login' before running this script."
    exit 1
}

# 2. Verify git is installed
if (!(Get-Command "git" -ErrorAction SilentlyContinue)) {
    Write-Error "Git is not installed. Please install git to continue."
    exit 1
}

# 3. Create the remote repository via GitHub API (gh cli wrapper)
Write-Host "[1/4] Creating repository '$OrganizationName/$RepoName' via GitHub API..." -ForegroundColor Yellow
$CreateCommand = "gh repo create $OrganizationName/$RepoName --$Visibility"
Invoke-Expression $CreateCommand

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to create repository. Check your permissions or if the repository already exists."
    exit 1
}
Write-Host "Repository created successfully." -ForegroundColor Green


# 4. Initialize Local Git Repository
Write-Host "[2/4] Initializing local git repository..." -ForegroundColor Yellow
git init
git add .
git commit -m "chore: Initialize Antigravity OS core template"
git branch -M main

# 5. Link remote
Write-Host "[3/4] Linking local to remote repository..." -ForegroundColor Yellow
git remote add origin "https://github.com/$OrganizationName/$RepoName.git"

# 6. Push files and setup team branch
Write-Host "[4/4] Pushing Antigravity system files to GitHub..." -ForegroundColor Yellow
git push -u origin main

Write-Host ""
Write-Host "=============================================" -ForegroundColor Green
Write-Host " BOOTSTRAP COMPLETE" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green
Write-Host "The Antigravity AI CTO template has been successfully pushed to:"
Write-Host "https://github.com/$OrganizationName/$RepoName"
Write-Host ""
Write-Host "Team Usage Instructions:"
Write-Host "- Ensure team members clone this repository as the base template."
Write-Host "- Developers must use the 'Antigravity:' prefix locally in IDEs pointing to this folder to trigger the AI CTO mode."
