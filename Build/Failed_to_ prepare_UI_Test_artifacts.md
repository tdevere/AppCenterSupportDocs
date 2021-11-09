# Invalid options were used to prepare the test artifacts, please try again.

# Discussion

This error is fairly clear: invaild options were used... However we do not have an immediate clue as to which option was invaild. In the context of a custom build script these details may be further obfuscated.

## Approach

If you are using the App Center CLI to prepare the TEST run, please ensure to quailify the paramaters used within your script by printing those out to the build log (Echo or Write-Host statements will suffice).

If you have the complete build command, make sure to try executing that locally outside of App Center. If you're able to replicate the issue and the options appear valid, please share these details with support when you open a question for our team (see Contact App Center Support).

## Spaces In Paths
One particularly difficult problem may happen if you reference a path which contains spaces in directory names as a parameter. In this case, you may see the following error:

    Preparing tests... failed.
    Error: Failed to prepare UI Test artifacts using command "test-cloud.exe prepare" with error message:
    Invalid options were used to prepare the test artifacts, please try again. If you can't work out how to fix this issue, please contact support.

### Workaround
Avoid the use of spaces in your repo to avoid this situation. Or copy the files to a path which you can reference which does not include spaces.


# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)