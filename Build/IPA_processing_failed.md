# error: exportArchive: IPA processing failed

## Discussion

If the Xcode build step includes line(s) with the following details
* ` error: exportArchive: IPA processing failed` 
* ` Error Domain=IDEFoundationErrorDomain Code=1 "IPA processing failed" UserInfo={NSLocalizedDescription=IPA processing failed}`

This indicates that your app has a dynamic library with i386 or x86_64 architecture.        

# Solution
A dynamic library with i386 or x86_64 architecture is not allowed when archive in Xcode 11. Those architectures must be removed from the mentioned library. This can be done by running the following command on the library in terminal:

` lipo SmartAccessLib.a -remove x86_64 -output SmartAccessLib.a `

(Replace SmartAccessLib.a with your own static library name) 

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)