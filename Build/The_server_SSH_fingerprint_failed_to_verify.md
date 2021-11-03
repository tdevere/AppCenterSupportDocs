# The server SSH fingerprint failed to verify.

# Disscussion

If you meet the following conditions
*  Xcode build step includes line(s) 
    * ` "The server SSH fingerprint failed to verify.`  
    * ` Fetching git@github.com:name/project.git `
*  The XCode project has a package dependency which requires SSH.
    *  The SSH keys are password-protected  

>> More Info: SSH password protected keys require manual input at least once during the build session to receive and cache the Password. This is not supported in the App Center enviornment. Also, out-of-the-box the build agent in App Center would need to configure the known_hosts for the repo host. 

# Solution

Switch to HTTPS Reference
* Use a Personal Access Token (PAT) [GitHub Example](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)
* Configure [App Center enviornmental variables](https://docs.microsoft.com/en-us/appcenter/build/custom/variables/#variables-declared-in-build-configuration)
    * Username - 
    * Password - PAT Token 
* Add a Post Clone Script ([see example here](/Build_Scripts/Replace_Package_References_With_Secure_Reference.sh) ) to modify package references to include the Username and Password on the App Center build agent 

Recommendations and References
> Reference the [package dependency](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) by HTTPS

> [Azure DevOps](http://dev.azure.com/) has more sophsticated options which may be worth exploring

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)