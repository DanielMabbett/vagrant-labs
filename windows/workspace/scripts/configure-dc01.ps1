$username = "corp\vagrant"
$password = convertto-securestring `
-String "vagrant" `
-AsPlainText `
-Force
$safemodepassword = convertto-securestring `
-String "K1ckAssL1v!" `
-AsPlainText `
-Force

$CORPcred = new-object `
-typename System.Management.Automation.PSCredential `
-argumentlist $username, $password

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Import-Module ADDSDeployment

Install-ADDSForest `
-DomainName corp.contoso.com `
-DomainMode Win2012R2 `
-ForestMode Win2012R2 `
-DatabasePath "c:\Windows\NTDS" `
-SysvolPath "c:\Windows\SYSVOL" `
-LogPath "c:\Windows\Logs" `
-SafeModeAdministratorPassword $safemodepassword `
-Force `

#Restart-Computer -Force