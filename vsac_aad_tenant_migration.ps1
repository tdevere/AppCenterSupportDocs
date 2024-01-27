function Get-AppCenterOrg
{
    <#
 .Synopsis
  Returns the details of a single organization

 .Description
  Retrieves App Center Organazation. https://openapi.appcenter.ms/#/account/organizations_get

 .Parameter ApiUserToken
  User API tokens work across all organization and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Retrieves App Center Organazation. Requires Environment variable 
   Get-AppCenterOrg -ApiUserToken YourApiToken -OrgName InsertYourOrgNameHere
#>
    param([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName)

    $bContinue = $true

    $Uri = "https://api.appcenter.ms/v0.1/orgs/$OrgName"
    
    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    if ($results.Length -eq 0)
    {
        $bContinue = $false
    }
    
    if ($bContinue)
    {
        $subscriptions = Get-AppCenterOrgAzureSubscription -ApiUserToken $APIKey -OrgName $OrgName

        if ($subscriptions.Length -eq 0)
        {
            $bContinue = $false
        }       
    }

    if ($bContinue)
    {
        $aadTenant = Get-AppCenterOrgAAD_Tenant -ApiUserToken $APIKey -OrgName $OrgName

        if ($aadTenant.Length -eq 0)
        {
            $bContinue = $false
        }     
    }

    if ($bContinue)
    {
        $OrgUsers = Get-AppCenterOrgUsers -ApiUserToken $ApiUserToken -OrgName $OrgName

        if ($OrgUsers.Length -eq 0)
        {
            $bContinue = $false
        }     
    }

    if ($bContinue)
    {
        $results | Add-Member -MemberType NoteProperty -Name 'Azure Subscription' -Value $subscriptions
        $results | Add-Member -MemberType NoteProperty -Name 'AAD Tenant' -Value $aadTenant
        $results | Add-Member -MemberType NoteProperty -Name 'Users' -Value $OrgUsers
    }

    return $results
}

function Get-AppCenterOrgAzureSubscription
{
    <#
 .Synopsis
  Returns the details of a single organization

 .Description
  Retrieves App Center Organazation. https://openapi.appcenter.ms/#/account/organizations_get

 .Parameter ApiUserToken
  User API tokens work across all organization and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Retrieves App Center Organazation. Requires Environment variable 
   Get-AppCenterOrg -ApiUserToken YourApiToken -OrgName InsertYourOrgNameHere
#>
    param([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName)

    $Uri = "https://api.appcenter.ms/v0.1/orgs/$OrgName/azure_subscriptions"
    
    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    if ($results.Length -eq 0)
    {
        return 'Failed to get results.'
    }
    else 
    {
        return $results
    }
}

function Get-AppCenterOrgAAD_Tenant
{
    <#
 .Synopsis
  Returns the details of a single organization

 .Description
  Retrieves App Center Organazation. https://openapi.appcenter.ms/#/account/organizations_get

 .Parameter ApiUserToken
  User API tokens work across all organization and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Retrieves App Center Organazation. Requires Environment variable 
   Get-AppCenterOrg -ApiUserToken YourApiToken -OrgName InsertYourOrgNameHere
#>
    param([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName)

    $Uri = "https://api.appcenter.ms/v0.1/orgs/$OrgName/aad_tenant"
    
    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    if ($results.Length -eq 0)
    {
        return 'Failed to get results.'
    }
    else 
    {
        return $results
    }
}

function Get-AppCenterOrgs
{
    <#
 .Synopsis
  Retrieves list of App Center Organazations.

 .Description
  Retrieves list of App Center Organazations.

 .Parameter ApiUserToken
  User API tokens work across all organizations and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Retrieves list of App Center Organazations. Requires Environment variable 
   Get-AppCenterOrgs -ApiUserToken YourApiToken 

#>

    param([string] $ApiUserToken)

    $Uri = 'https://api.appcenter.ms/v0.1/orgs'
    
    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    if ($results.Length -eq 0)
    {
        return 'Failed to get results.'
    }
    else 
    {
        return $results
    }
}
function Get-AppCenterOrgUsers
{
    <#
 .Synopsis
    Returns a list of users that belong to an organization.

 .Description
    Returns a list of users that belong to an organization. https://openapi.appcenter.ms/#/account/users_listForOrg

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example

   Get-AppCenterOrgUsers -ApiUserToken $env:ApiUserToken -OrgName "YourOrgNameHere"

   email        : sample@user.com
   name         : sample@user.com
   display_name : Sample User
   joined_at    : 2022-04-22T23:55:14.918Z
   role         : admin
#>
    param ([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName)    

    $Uri = "https://api.appcenter.ms/v0.1/orgs/$OrgName/users"

    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    return $results
}
function Get-AppCenterOrgTesters
{
    <#
 .Synopsis
    Returns a list of testers that belong to an organization.

 .Description
    Returns a list of testers that belong to an organization. https://openapi.appcenter.ms/#/account/distributionGroups_listAllTestersForOrg

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example

   Get-AppCenterOrgTesters -ApiUserToken $env:ApiUserToken -OrgName "YourOrgNameHere"

   display_name                email              name
   ------------                -----              ----
   Sample User               sample@user.com      sample@user.com
#>
    param ([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName)    

    $Uri = "https://api.appcenter.ms/v0.1/orgs/$OrgName/testers"

    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    return $results
}

function Add-AppCenterCollaborator 
{
    <#
 .Synopsis
  Add new collborator to App Center organization.

 .Description
  Add new collborator to App Center organization.

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token  

 .Parameter newCollaboratorEmailAddress
  Email address of new collaborator

 .Parameter orgName
  Email address of new collaborator

 .Parameter AppCenterRole
  Valid options: { member, admin, collaborator }. Make sure to use lowercase lettering.

 .Example
   # Retrieves list of App Center apps. Requires Environment variable 
   Add-AppCenterCollaborator -$orgName "" -newCollaboratorEmailAddress "some@address.com"
 
#>
    Param
    (
        [string] $ApiUserToken,
        [string] $orgName, 
        [string] $AppCenterRole = 'member', 
        [string] $newCollaboratorEmailAddress
    )
   
    #API: https://openapi.appcenter.ms/#/account/orgInvitations_create

    $uri = "https://appcenter.ms/api/v0.1/orgs/$orgName/invitations"

    $headers = @{    
        'X-API-Token' = $ApiUserToken
    }
    
    #region BUG on Windows using CURL.exe
    <#

    #Bug: CURL.EXE on Windows has trouble parsing " and I never found a way around it. But sticking with native Invoke-WebRequest the problem was avoided. 
    #To chase this down, I would get tracing from the platform and see what the difference is with how the " is encoded for post data
    #$jsonStr = '{ "user_email": "'+$newCollaboratorEmailAddress+'", "role": "$AppCenterRole" }'
    #$jsonStr = '{ \"user_email\": \"' + $newCollaboratorEmailAddress +'\", \"role\": \"' + $AppCenterRole + '\" }'
    $results = curl.exe -X POST $uri --data-raw ('{"user_email": "' + $newCollaboratorEmailAddress + '","role": "' + $AppCenterRole + '"}') -H "Content-Type: application/json" -H "accept: application/json" -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json 
    #$results = curl.exe -X POST $uri --data-ascii ($json) -H "Content-Type: application/json" -H "accept: application/json" -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json     
    #$results = curl.exe -X POST $uri -d $jsonStr  -H "Content-Type: application/json" -H "accept: application/json" -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json 
    #>
    #endregion 

    $jsonStr = '{ "user_email": "' + $newCollaboratorEmailAddress + '", "role": "' + $AppCenterRole + '" }'
    $converedtJson = $jsonStr | ConvertFrom-Json
    $finalJson = ConvertTo-Json -InputObject $converedtJson
    

    $results = Invoke-WebRequest -Uri $uri -Method Post -Body $finalJson -Headers $headers -ContentType 'application/json' | ConvertFrom-Json 
    
    return $results

}

function Get-AppCenterApp
{
    <#
 .Synopsis
    Return a specific app with the given app name which belongs to the given owner.

 .Description
    Return a specific app with the given app name which belongs to the given owner.

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Retrieves list of App Center apps. Requires Environment variable 
   Get-AppCenterApp -ApiUserToken ****** -Orgname YourOrgHere -AppName YourAppHere
#>
    param ([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName,
        [ValidateNotNullOrEmpty()]    
        [string]$AppName)    

    $bContinue = $true

    $Uri = "https://api.appcenter.ms/v0.1/apps/$OrgName/$AppName"

    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    if ($results.Length -eq 0)
    {
        $bContinue = $false
    }

    if ($bContinue)
    {
        $BuildBilling = Get-AppCenterAppBillingBuild -ApiUserToken $ApiUserToken -OrgName $OrgName -AppName $AppName
        
        if ($BuildBilling.Length -eq 0)
        {
            $bContinue = $false
        }
    }

    if ($bContinue)
    {
        $TestBilling = Get-AppCenterAppBillingTest -ApiUserToken $ApiUserToken -OrgName $OrgName -AppName $AppName
        
        if ($TestBilling.Length -eq 0)
        {
            $bContinue = $false
        }
    }

    if ($bContinue)
    {
        $ExportConfiguration = Get-AppCenterExportConfiguration -ApiUserToken $ApiUserToken -AppName $AppName -OrgName $OrgName

        if ($ExportConfiguration.Length -eq 0)
        {
            $bContinue = $false
        }
    }

    if ($bContinue)
    {
        $Users = Get-AppCenterAppUsers -ApiUserToken $ApiUserToken -OrgName $OrgName -AppName $AppName

        if ($Users.Length -eq 0)
        {
            $bContinue = $false
        }
    }

    if ($bContinue)
    {
        $bugTracker = Get-AppCenterAppBugTracker -ApiUserToken $ApiUserToken -OrgName $OrgName -AppName $AppName
        if ($bugTracker.Length -eq 0)
        {
            $bContinue = $false
        }
    }



    if ($bContinue)
    {
        $results | Add-Member -MemberType NoteProperty -Name 'Billing_Build' -Value $BuildBilling
        $results | Add-Member -MemberType NoteProperty -Name 'Bug_Tracker' -Value $bugTracker
        $results | Add-Member -MemberType NoteProperty -Name 'Billing_Test' -Value $TestBilling
        $results | Add-Member -MemberType NoteProperty -Name 'Exports' -Value $ExportConfiguration
        $results | Add-Member -MemberType NoteProperty -Name 'Users' -Value $Users 
    }

    return $results
}

function Get-AppCenterApps
{
    <#
 .Synopsis
    Return all apps which belongs to the given owner.

 .Description
    Return all apps which belongs to the given owner. https://openapi.appcenter.ms/#/account/apps_list

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Retrieves list of App Center apps. Requires Environment variable 
   Get-AppCenterApps -Orgname YourOrgHere -AppName YourAppHere
#>
    param ([string] $ApiUserToken)    

    $Uri = 'https://api.appcenter.ms/v0.1/apps/'

    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    return $results
}
function Get-AppCenterAppsByOrg
{
    <#
 .Synopsis
  Retrieves list of App Center Apps for a specifc Organization.

 .Description
  Retrieves list of App Center Apps for a specifc Organization. https://openapi.appcenter.ms/#/account/apps_listForOrg

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Retrieves list of App Center Apps by Org.
   Get-AppCenterAppsByOrg -ApiUserToken InsertYourTokenHere -OrgName InsertYourOrgNameHere

#>

    param ([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName)    

    $Uri = "https://api.appcenter.ms/v0.1/orgs/$OrgName/apps"

    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    if ($results.psobject.properties.match('statusCode').Count)
    {
        Write-Host "Error: $results"
    }
    
    return $results
}
function Get-AppCenterAppsByOrgList
{
    <#
 .Synopsis
  Enumerate a list of Orgs and retrieve list of App Center Apps for a each Organization.

 .Description
  Enumerate a list of Orgs and retrieve list of App Center Apps for a each Organization.. https://openapi.appcenter.ms/#/account/apps_listForOrg

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Enumerate a list of Orgs and retrieve list of App Center Apps for a each Organization. Requires Environment variable 
   Get-AppCenterAppsByOrgList ApiUserToken InsertYourTokenHere -OrgList InsertYourOrgNameHere

#>
    param ([string] $ApiUserToken = $env:ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        $OrgList)    

    $Global:OrgAppList = New-Object 'Collections.Generic.List[psobject]' #Variable storing Orgs and Apps list

    Write-Host "Org names: $OrgList"

    foreach ($org in $OrgList)
    {
        Write-Host "Getting Results for App Center Organization: $org.name"
        $apps = Get-AppCenterAppsByOrg -ApiUserToken $ApiUserToken -OrgName $org.name

        if (!$apps.psobject.properties.match('statusCode').Count)
        {
            $Global:OrgAppList.Add($apps) 
        }
      
    }

    return $Global:OrgAppList.ToArray()
}

function Get-AppCenterAppBillingBuild
{
    <#
 .Synopsis
    Return a specific app with the given app name which belongs to the given owner.

 .Description
    Return a specific app with the given app name which belongs to the given owner.

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Retrieves list of App Center apps. Requires Environment variable 
   Get-AppCenterApp -ApiUserToken ****** -Orgname YourOrgHere -AppName YourAppHere
#>
    param ([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName,
        [ValidateNotNullOrEmpty()]    
        [string]$AppName)    

    $Uri = "https://api.appcenter.ms/v0.1/apps/$OrgName/$AppName/billing/aggregated?service=Build"

    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    return $results
}

function Get-AppCenterAppBillingTest
{
    <#
 .Synopsis
    Return a specific app with the given app name which belongs to the given owner.

 .Description
    Return a specific app with the given app name which belongs to the given owner.

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Retrieves list of App Center apps. Requires Environment variable 
   Get-AppCenterApp -ApiUserToken ****** -Orgname YourOrgHere -AppName YourAppHere
#>
    param ([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName,
        [ValidateNotNullOrEmpty()]    
        [string]$AppName)    

    $Uri = "https://api.appcenter.ms/v0.1/apps/$OrgName/$AppName/billing/aggregated?service=Test"

    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    return $results
}

function Get-AppCenterExportConfiguration
{
  <#
 .Synopsis
  Retrieves list of App Center Export Configuration if enabled (Blob or Application Insights)

 .Description
Retrieves list of App Center Export Configuration if enabled (Blob or Application Insights)

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example
   # Retrieves list of App Center Apps that have Export enabled (Blob or Application Insights).
   Get-AppCenterExportConfiguration -ApiUserToken ***** YourApiToken -OrgName ***** -AppName *****

#>

    param ([string] $ApiUserToken,
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string] $AppName,
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]    
    [string]$OrgName)    

    $uri = 'https://api.appcenter.ms/v0.1/apps/' + $OrgName + '/' + $AppName + '/export_configurations'

    $results = curl.exe -X GET $Uri -H "Content-Type: application/json" -H "accept: application/json" -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json  
    return $results
}

function Get-AppCenterAppUsers
{
    <#
 .Synopsis
    Returns a list of testers that belong to an organization.

 .Description
    Returns a list of testers that belong to an organization. https://openapi.appcenter.ms/#/account/distributionGroups_listAllTestersForOrg

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example

   Get-AppCenterOrgTesters -ApiUserToken $env:ApiUserToken -OrgName "YourOrgNameHere"

   display_name                email              name
   ------------                -----              ----
   Sample User               sample@user.com      sample@user.com
#>
    param ([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $AppName
        )    

    $Uri = "https://api.appcenter.ms/v0.1/apps/$OrgName/$AppName/users"

    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    return $results
}

function Get-AppCenterAppBugTracker
{
    <#
 .Synopsis
    Returns a list of testers that belong to an organization.

 .Description
    Returns a list of testers that belong to an organization. https://openapi.appcenter.ms/#/account/distributionGroups_listAllTestersForOrg

 .Parameter ApiUserToken
  User API tokens work across all apps and apps that you're associated with. https://docs.microsoft.com/en-us/appcenter/api-docs/#creating-an-app-center-user-api-token

 .Example

   Get-AppCenterOrgTesters -ApiUserToken $env:ApiUserToken -OrgName "YourOrgNameHere"

   display_name                email              name
   ------------                -----              ----
   Sample User               sample@user.com      sample@user.com
#>
    param ([string] $ApiUserToken,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]    
        [string]$OrgName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $AppName
        )    

    $Uri = "https://api.appcenter.ms/v0.1/apps/$OrgName/$AppName/alerts_bugtracker"

    $results = curl.exe -X GET $Uri -H 'Content-Type: application/json' -H 'accept: application/json' -H "X-API-Token: $ApiUserToken" | ConvertFrom-Json

    return $results
}

function Setup
{
    $APIKey = $env:appcenterapi #Plug your own in here SEE https://learn.microsoft.com/en-us/appcenter/api-docs/
    $OrganizationName = 'Examples'
    $Organization = Get-AppCenterOrg -ApiUserToken $APIKey -OrgName $OrganizationName 
    $OrganizationApps = Get-AppCenterAppsByOrg -ApiUserToken $APIKey -OrgName $OrganizationName 
    $Applications = $OrganizationApps | % { Get-AppCenterApp -ApiUserToken $APIKey -OrgName $OrganizationName -AppName $_.name }
}


#You need to run Setup at least once

#Migration Check List

#Existing Users who have an app center account, after AAD tenant migration, may not be able to log into app center. 
    #SEE: https://learn.microsoft.com/en-us/appcenter/general/account#account-is-already-associated-with-another-identity-provider
#In such cases, the users should open a free support ticket on the App Center portal and share the exact corralation id they got in the error when logging in.
    #SEE: https://learn.microsoft.com/en-us/appcenter/general/support-center#contact-us

#Export Services may be impacted during a migration. You will want to see what apps use this service, and verify the service is still enabled after the migration. 
    #SEE: https://learn.microsoft.com/en-us/appcenter/analytics/export

#Azure Subscriptions may be impacted in a migration. It would be good to know what subscriptions are in use in such situations to quickly identify. 
    #SEE: https://learn.microsoft.com/en-us/appcenter/general/azure-subscriptions

#To find apps which could be imapcted during a migration, you can check their billing status
    #SEE: https://learn.microsoft.com/en-us/appcenter/general/billing

#If you are using bug tracker integration with Azure, you should identify possible impacted apps
    #SEE: https://learn.microsoft.com/en-us/appcenter/dashboard/bugtracker/

#Below are some API endpoints you can use to help answer these questions:

Write-Host 'Does the Organization have an azure subscription?' -ForegroundColor Yellow
$Organization.'Azure Subscription' | Select-Object -Property subscription_id, tenant_id, is_billing

write-host 'Organization Users who may be impacted. Use a search patter for your new/old tenant or domain name' -ForegroundColor Yellow
$Organization | ? { $_.Users | ? { $_.email.ToString().Contains('microsoft.com')} } | Select-Object Users -Unique | Write-Output

Write-Host 'What applications have an Export Services enabled?' -ForegroundColor Yellow
$Applications | ? { $_.Exports | Where-Object { $_.Values -ne $null -and $_.Values.Count -gt 0 } } | Select-Object -Property id, name 

write-host 'Applications Users who may be impacted. Use a search patter for your new/old tenant or domain name' -ForegroundColor Yellow
$Applications | ? { $_.Users | ? { $_.email.ToString().Contains('microsoft.com')} } | Select-Object Users -Unique

Write-host 'Applications which have Bug Tracking enabled' -ForegroundColor Yellow
$Applications | ? { $_.Bug_Tracker.state -eq 'Enabled' }
