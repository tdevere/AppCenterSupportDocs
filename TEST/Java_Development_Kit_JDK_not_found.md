# Java Development Kit (JDK) not found.

## Discussion
While executing the AppCenter CLI Test command to initiate a run, you may encounter the following error:

* ` Preparing tests... Java Development Kit (JDK) not found. Please make sure that it is installed and if it's still not located, please set the JAVA_HOME environment variable to point to the directory. `

## Things To Check

Examples will be demonstrated in [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.2)

1. Ensure the Java SDK is installed

```
PS C:\> Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object -Property DisplayName | Select-String -Pattern java

@{DisplayName=Java(TM) SE Development Kit 18.0.1.1 (64-bit)}
@{DisplayName=Java(TM) SE Development Kit 17.0.3.1 (64-bit)}
@{DisplayName=Java(TM) SE Development Kit 18.0.2 (64-bit)}
```

Or possibly 

```
PS C:\> Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object -Property DisplayName | Select-String -Pattern jdk

@{DisplayName=Microsoft Build of OpenJDK with Hotspot 11.0.12+7 (x64)}
```

2. Check that the JAVA_HOME enviornment variable is set. 

``` 
PS C:\> [System.Environment]::GetEnvironmentVariable("JAVA_HOME")
C:\Program Files\Microsoft\jdk-11.0.12.7-hotspot
```

3. Determine path location of JarSigner.exe. This will determine where the JAVA_HOME variable should be set for Appcenter Cli to function correctly. 

```
PS C:\> get-command jarsigner.exe

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Application     jarsigner.exe                                      11.0.12.0  C:\Program Files\Microsoft\jdk-11.0.12.7-hotspot\bin\jarsigner.exe

```

* If the path of JarSigner.exe is not found in the path of the JAVA_HOME environment, you may hit the error: ` Preparing tests... Java Development Kit (JDK) not found. Please make sure that it is installed and if it's still not located, please set the JAVA_HOME environment variable to point to the directory. `  

### Solution

Set the JAVA_HOME directory to point to the location the JarSigner.exe

```
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", ":\Program Files\Microsoft\jdk-11.0.12.7-hotspot\")
```
` Warning: Do not include the \bin directory in the JAVA_HOME environment variable path. ` Doing so may result in a invalid search path being sought by the Appcenter Cli

![](/Images/jaresigner_notfound.png)

## References
* [App Center Test Docs](https://docs.microsoft.com/en-us/appcenter/test-cloud/)

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)