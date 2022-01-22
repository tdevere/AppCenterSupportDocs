# Consideration of Creating App Center Application via GitHub Integration

## Discussion
There are three ways to create an App Center application: the CLI, portal, and via GitHub. However, there differences which you should consider before committing to a particular stategy when creating your App Center application which may not be apparent until after you spend the effort to configure the App. These differences could result in reduced functionality or loss of build configuration and history. To avoid this situation, take a moment to review this brief overview of concerns.

### Control of Automatic Build on Pull Requests
App Center provides one of two options regarding build configuration:
* Build this branch on every push
* Manually choose when to run builds

Opening a pull request on GitHub will start an App Center build. However, users do not always want a build to trigger on a PR. If the App was configured via GitHub integration, ```there is no way to configure the App to avoid the PR build request```. The only workaround currently would be to create a build script post clone and evaluate the change and abort the build if it does not satisfy your build needs. This is not ideal since a build much kick off, consuming resources and time only to abort the process. 

On the other hand, if the App was built via App Center portal and build was configured manually to a GitHub hosted repo, you can configure the WebHook notification settings in GitHub to not trigger when a PR is made. After the initial build configuration is saved in the App Center portal, back over at GitHub on the App settings, you will see a Webhook.

![](/Images/GitHub_Webhooks.png "GitHub Webhook")

![](/Images/GitHub_Webhook_Pull_Request.png "GitHub Webhook - Pull Request")

The App Center integrated GitHub app does not utilize Webhooks via GitHub to send/revice build events. If you are already in this condition, you will need to create a new App or lose the desired functionality.


## References 
[Connecting Repositories Using the GitHub App](https://docs.microsoft.com/en-us/appcenter/build/github-app)

[GitHub Marketplace App Center](https://github.com/marketplace/app-center)


# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)