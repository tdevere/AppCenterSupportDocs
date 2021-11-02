# Command Not Found

## Discussion
This error will most likely come from a custom build script. It may also be accompanied by this error in the build log: ` ##[error]The process '/bin/bash' failed with exit code 2 `

Possible reasons for this failure
1. An invalid shell command is being used within the script
2. A syntax error which causes the script to be parsed incorrectly.
3. The script contains line endings which are not compatible with the build agent. 
    * This commonly happens when the script is saved with Windows line endings and later executed MacOS.
    * In this case, please open the file in a text editor and change the line endings to Unix(LF) for iOS and Android builds. 
    * For Windows builds the line ending should be Windows (CR LF).

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)