# Missing Organizations In Search While Linking App to AzureDevOps Hosted Repository

## Discussion

When [linking](https://learn.microsoft.com/en-us/appcenter/build/connect#azure-devops) your Azure DevOps repository to an App Center application, you may not find the organization and repostiory you expected.

![](/Images/VSAC_ConnectRepo.png "Connect Repository")


If you have mulitple Azure DevOps Organizations but do not see them listed during the "connect to repo" step, try looking for the following information. 

``` These require an account with access to these repositories ```

## How are your organizations divided?
Sign into [Visual Studio](https://app.vsaex.visualstudio.com/) with the same account that was used when originally setting up App Center integration with Azure DevOps.

![](/Images/visual_studio_com_organization_view.png "Visual Studio Organization View")

```Note``` - Whatever you see here by default, is likely to be the included in the list of organizations found in the App Center portal when linking the repository. If not, then likely the default directory was changed at some point after App Center was linked. This does not matter for the purpose of this document.

Notice the drop down list and change the view until you find the view which includes the organization you are trying to add. If you do not find it, you have a different problem than this document addresses. Please check that the correct Azure DevOps account was used with connecting from App Center.

App Center pulls a list of Organizations found for the default tenant the account is configured for in Azure. Much like this Visual Studio view of organizations display when changing the drop down, which is changing the tenant for you, you will only see a list of organizations for that directory. 

As you may have guessed by now, when we query for the list of Organizations to you in the portal, we only ask for the default directory for that account. So only resources from that account will show up in our list. 

## OK. So What Do I Do Now?
1. Migrate the resources in one Azure Active Directory, to the default directory. All organizations will then show up the default directory and should then be included in the results returned from App Center's call to list Azure DevOps organizations. 
2. Use an account from the tenant connected to Azure DevOps when linking from App Center. This simply utilizes the same means we already use when configuring DevOps to App Center. 


# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)