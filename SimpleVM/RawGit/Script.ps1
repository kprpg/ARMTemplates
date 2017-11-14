#
# Script.ps1
#
## Switch-AzureMode -Name AzureResourceManager
Add-AzureRmAccount
Get-AzureRmSubscription
Set-AzureSubscription -SubscriptionName 'Windows Azure MSDN - Visual Studio Ultimate'
Set-AzureSubscription -SubscriptionId 49c7ab35-7737-4a04-8ae6-49ec7aa971c7
New-AzureRmResourceGroup -Name rgARMDeploy -Location 'South Central US' -Force

$Deloyment = @{ 
	Name = 'MyDeployment'; 
	ResourceGroupName = 'rgARMDeploy';
	Mode = 'Complete';
	TemplateFile = '$PSScriptRoot\AzureDeploy.json';
	TemplateParameterObject = @{
		newStorageAccountName = 'armdeploystorage1';
		adminUsername = 'gpillai';
		adminPassword = 'lanka@DEVI321';
		dnsNameForPublicIP = 'dnsarm';
		}
	Force = $true;
	}
	
New-AzureRmResourceGroupDeployment @Deployment;
New-AzureRmResourceGroupDeployment -Name 'MyDeployment' -ResourceGroupName 'rgARMDeploy' `
     -Mode Complete -TemplateFile .\SimpleVM\RawGit\azuredeploy.json
	 