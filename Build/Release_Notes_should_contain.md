# Release Notes should contain min 10 to max 4000 characters but contain 4 characters.

If your build log contains the text `##[error]{"code":"bad_request","message":"Error: Failed to publish to store. Release Notes should contain min 10 to max 4000 characters but contain 4 characters."}`

This indicates you may not have satisfied the requirement for adding release notes. 
1. This was imposed by Apple directly [Issue 1780](https://github.com/microsoft/appcenter/issues/1780)
2. [Apple recommends](https://developer.apple.com/app-store/review/guidelines/) to make clear what the release is about in detail. Failure to do so they say may delay the process. 
3. To work around the issue, add notes which meet these recommendations. 

  
# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)