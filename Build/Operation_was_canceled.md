# The operation was canceled

## Disscussion

If you build log contains the text `##[error]The operation was canceled `
This may indicate your build exceeded the alloted time for builds

Often builds can take anywhere from 3 to 60 minutes give or take depending on the project. This error will occur when your build exceeds the time limit imposed on your account.

## Solutions 
1. Upgrade your build plan to [60 minutes](https://docs.microsoft.com/en-us/appcenter/general/pricing#build-paid-tier) which would allow more time for the build to complete.
2. Builds can take longer due to App Center Virtual Machines being wiped clean after every build. Builds locally usually run faster due to  locally cached files. One way to decrease the time of build with iOS is to check in all pod files to your repo vs letting app center install them for you. This may not be the best option since some do not prefer a heavy repo but still is an option to reduce build time. 

If your build is canceled immediately after starting, please contact support with the details below.                         
    
# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/ContactingAppCenterSupport)