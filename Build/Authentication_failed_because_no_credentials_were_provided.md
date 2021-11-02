# Authentication failed because no credentials were provided.

## Discussion

### If the Xcode build step includes line(s) with the following details
* ` Fetching https://github.com/***/ExampleSwiftPackage1.git ` 
* ' xcodebuild: error: Could not resolve package dependencies: ' 
* ' Authentication failed because no credentials were provided. '    

Your Xcode project has package dependencies which require Authentication.

## Solution
* Create three [App Center Build Environment Varibles](https://docs.microsoft.com/en-us/appcenter/build/custom/variables/#variables-declared-in-build-configuration)
    * IsInAppCenter
    * Username
    * Password
* Add this or a similar script to your repo, push, then update the App Center build configuration through the portal. [Configure Username and Password for Secured Swift Package Dependecy Example](/Build_Scripts/Configure_Username_and_Password_for_Secured_Swift_Package_Dependecy.md)
  
   

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)