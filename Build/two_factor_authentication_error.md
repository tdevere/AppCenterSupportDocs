# two factor authentication error

## Disscussion

If you notice a failed build with the following error on the Distribution step:

    ##[error]{"code":"two_factor_authentication_error","message":"Error: Failed to publish to store. apple connection is not valid for connectionId: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"}

## Workaround
This indicates that AppCenter needs you to update your Apple Store connection. This can be managed in the Appcenter.ms portal. More more details, read this [documenation link](https://docs.microsoft.com/en-us/appcenter/distribution/stores/apple#reauthenticate-failed).

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)