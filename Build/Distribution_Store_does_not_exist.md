# Distribution Store with id {guid} does not exist.

## Discussion
You may find this error within the build log on App Center:` ##[error]{"code":"bad_request","message":"Error: Distribution Store with id {guid} does not exist."}`

Possible Cause: Store settings were changed after the build was configured in the portal

## Solutions
* Open build settings in App Center and remove the distribution step and save the configuration
* Open the build settings again and reselect the correct store destination. Then save your build configuration again.

## Note
Check that the Distribution Store ID is valid and update accordingly.
* You can also query the [App Center API](https://openapi.appcenter.ms/#/distribute/stores_list) to find a list of the registered Store GUID's
* Make sure you use a valid GUID in your build configuration or distribution scripts

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)