# NU1101: Unable to find package

If your build log contains the follow text `##[error]The nuget command failed with exit code(1) and error(NU1101: Unable to find package *******. No packages exist with this id in source(s): NuGetOrg`

## Issue 1
If you are attempting to restore private Nuget feeds.
* Explanation - When restoring private Nuget feeds the proper credentials and environment variables must be set in the nuget.config file for authentification.

### Issue 1 Solution 
To restore private NuGet feeds, use App Center [environment variables](https://docs.microsoft.com/en-us/appcenter/build/custom/variables/#variables-declared-in-build-configuration) to dynamically include the credentials in the NuGet.config file:

        <?xml version="1.0" encoding="utf-8"?>
            <configuration>
                <packageSources>
                    <add key="nuget" value="https://api.nuget.org/v2/index.json" />
                    <add key="MyGet" value="https://www.myget.org/F/$MyUsername/api/v2/index.json" />
                    <add key="MyAuthNuget" value="https://nuget.example.com/v2/index.json" />
                </packageSources>
                <activePackageSource>
                    <add key="All" value="(Aggregate source)" />
                <activePackageSource>
                    <packageSourceCredentials>
                        <MyAuthNuget>
                            <add key="Username" value="$myusername" />
                            <add key="ClearTextPassword" value="$password" />
                        </MyAuthNuget>
                    </packageSourceCredentials>
                </configuration>

* Push changes to repo. In your build configurations via App Center portal click Save and Build. 

## Issue 2
You are building a UWP Xamarin App and the same nuget feeds are accessible in both iOS and Android projects that share the current repository.
* Explanation - In rare occasions App Center detects the nuget.config file for iOS and android on the root level but fails to detect it for UWP projects.     

### Solution
Since the UWP app does not build with the the nuget.config file in the sln project root directory, you will can move the nuget.config into the project folder. 
* Push changes to repo. In your build configurations via App Center portal click Save and Build.  


# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)