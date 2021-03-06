function Get-WinADAccounts {
    [CmdletBinding()]
    param(
        [Object] $UserNameList,
        [Object[]] $ADCatalog
    )
    $Accounts = New-ArrayList
    foreach ($User in $UserNameList) {
        foreach ($Catalog in $ADCatalog) {
            $Element = $Catalog | Where-Object { $_.SamAccountName -eq $User }
            Add-ToArrayAdvanced -Element $Element -List $Accounts -SkipNull
        }
    }
    return $Accounts
}