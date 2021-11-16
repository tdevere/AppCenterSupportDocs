# error MSB4057: The target "_IsProjectRestoreSupported" does not exist in the project.

## Disscussion

Recently a change was introduced with an upgrade of Mono to 6.12.0.140. The default behavior of the "nuget restore" command has been changed in new Mono version (6.12.0.140) which impacts App Center builds. 

To check if you're hitting this problem, examine the build log for the following failure in the Restore Nuget build step:

* error MSB4057: The target "_IsProjectRestoreSupported" does not exist in the project.
* warning MSB4181: The "MSBuild" task returned false but did not log an error. 
* warning : Skipping restore for project '/Users/runner/work/1/s/*.UWP.csproj'. The project file may be invalid or missing targets required for restore.

This specifically impacts UWP projects within the Solution.

## Workaround

* use "dotnet restore" or ` dotnet sln $SLN_PATH remove $UWP_PATH `
* "msbuild -t:restore" commands instead of "nuget restore"


App Center does not expose a method to directly change the build or nuget restore commands. This is not the case in Azure. This limit forces us to look for another workaround. 

* add ` <Target Name="_IsProjectRestoreSupported" /> ` to the [UWP project.](https://github.com/actions/virtual-environments/issues/4060#issuecomment-961788816)
* remove the UWP project reference from the solution

Both recommendations come at some cost. Adding the empty target causes a new build failure to occur for the same project in App Center. If you don't use App Center for building UWP, this won't be a concern as it does not impact local builds. 

If you do build with App Center, then either option forces you to manage either adding/removing the UWP project reference to the solution or removing the _IsProjectRestoreSupported target dynamically if building specifically for UWP projects.





