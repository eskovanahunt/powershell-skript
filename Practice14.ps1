# ============================================
# system_report.ps1
# Kokkuvõttev ülesanne – PowerShell (Practice 14)
# ============================================

# Väljundfail
$reportFile = "report.txt"

# Tühjenda eelnev raport (kui eksisteerib)
"" | Out-File $reportFile

# --- Kuupäev ja kellaaeg (boonus) ---
$datetime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"Report created: $datetime" | Out-File $reportFile -Append
"-----------------------------------" | Out-File $reportFile -Append

# --- 1. Kasutaja sisend ---
$username = Read-Host "Sisesta oma nimi"
$timesInput = Read-Host "Mitu korda tervitust kuvada?"

# --- Boonus: kontroll, kas sisend on arv ---
if (-not ($timesInput -as [int])) {
    Write-Host "Viga: Palun sisesta arv!" -ForegroundColor Red
    exit
}

$times = [int]$timesInput

# --- 2. Tsükkel ---
for ($i = 1; $i -le $times; $i++) {
    $greeting = "Tere, $username! ($i)"
    Write-Host $greeting
    $greeting | Out-File $reportFile -Append
}

# --- 3. Süsteemiinfo ---
"" | Out-File $reportFile -Append
"SYSTEM INFORMATION" | Out-File $reportFile -Append
"Computer name: $env:COMPUTERNAME" | Out-File $reportFile -Append
"Logged in user: $env:USERNAME" | Out-File $reportFile -Append
"PowerShell version: $($PSVersionTable.PSVersion)" | Out-File $reportFile -Append

# --- 4. Cmdlet'id ---
"" | Out-File $reportFile -Append
"RUNNING PROCESSES (3)" | Out-File $reportFile -Append
Get-Process | Select-Object -First 3 Name, Id |
    Out-File $reportFile -Append

"" | Out-File $reportFile -Append
"SERVICES (3)" | Out-File $reportFile -Append
Get-Service | Select-Object -First 3 Name, Status |
    Out-File $reportFile -Append

# --- 5. Tingimuslause ---
"" | Out-File $reportFile -Append
if ($PSVersionTable.PSVersion.Major -lt 5) {
    $warning = "WARNING: PowerShell version is below 5!"
    Write-Host $warning -ForegroundColor Yellow
    $warning | Out-File $reportFile -Append
} else {
    $ok = "PowerShell version is suitable."
    Write-Host $ok -ForegroundColor Green
    $ok | Out-File $reportFile -Append
}

# --- 7. Vormindatud lõppteade ---
Write-Host "==========================="
Write-Host "Script finished successfully"
Write-Host "==========================="
