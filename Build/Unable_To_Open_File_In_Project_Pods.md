# unable to open file ` ` in project "Pods"  

# Discussion

If the Xcode build step includes line(s) with the following details
* ` error: /Users/runner/runners ` 
    * and on the same line has these two statements 
        * ` unable to open file `
        * ` in project "Pods" ` 

Your repro has a /Pods/ folder AND that repro does not contain the project that was attempted to be opened.        


# Solution

* Either commit the missing project to the /Pods/ folder in the repro 
* Or Delete the /Pods/ folder in the repro

>> To confirm you are hitting this problem, check the build step `Initialize job` for a CocoaPods task downloaded matching ` 2020-04-04T18:25:30.0905810Z Downloading task: CocoaPods (0.151.1) ` If there is no recorded task, App Center skipped it because it exists in the referenced repro already. [Read More](https://docs.microsoft.com/en-us/appcenter/build/ios/first-build#38-cocoapods)

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)