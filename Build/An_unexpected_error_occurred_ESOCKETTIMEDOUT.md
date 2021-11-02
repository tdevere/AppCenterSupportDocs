# error An unexpected error occurred: "https://registry.yarnpkg.com/****: ESOCKETTIMEDOUT" 

## Discussion
Either the build agent is having network problems or the endpoint hosting the package is having network problems. 
* Try to run the yarn installer locally. If it works then the build agent may have had a temporary network problem.
* If the build agent does have a network issue, you can report it to App Center team but the problem may resolve itself as well in time.
* Otherwise, the problem is with the repository or a wider networking issue altogether. You can still report the issue but there may be nothing App Center can do in this case. 
* [Check the NPM Status](https://status.npmjs.org/) for more details
  
# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)