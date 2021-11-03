# Code Signing Error: "Name Here" requires a provisioning profile. Select a provisioning profile in the Signing & Capabilities editor.

# Discussion

If the build log includes line(s) with the following details
* `  Code Signing Error: "Name Here" requires a provisioning profile. Select a provisioning profile in the Signing & Capabilities editor.  ` 
* `  Code Signing Error: Code signing is required for product type 'App Extension' in SDK 'iOS *' `  
        
Please review the following advice 
* In your build log, check the build step: "Install apple provisioning".        
* The identifier that belongs to your app extension should match the provisioning profile uploaded to App Center.
* Now check the build step: "Update Xcode Build Settings" `
    * This target identifier should match the uploaded identifier in the install apple provisioning build step.  
    * If it does not match the above error will be triggered.

Often when you are building an app that requires app extensions, the App Center UI does not allow you to pick the specific configuration you are interested in using for an app extension. The code which analyzes these settings detects more than one configuration for an app extension, it selects the first one found. Often the first one may be a dev or debug configuration which leads to the error. 

# Solution:
* Set the FIRST configuration to the target that matches the provisioning profile uploaded to App Center. These settings are detectd at configuration time and not build time. Make this change in Xcode and commit the results. 
* If you would like, you can revert the change - but then you will need to be careful not to update the configuration from App Center again because it will detect that change and then choose the incorrect configuration. 
* Once changes are pushed to your repo. Open up your build configuration in the App Center portal and click Save and Build. 

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)