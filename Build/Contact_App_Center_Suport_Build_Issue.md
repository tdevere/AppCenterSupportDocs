# How To Contact VS App Center Support
To ensure we can assist you quickly and without delay for requesting these details after opening a support case with App Center, please review this documenation and provide these details when opening a Build case.

## Verify Build Works Locally with a Clean Repo

If the build succeeds on your local Windows or Mac computer but not on App Center, then it is usually because of uncommitted files, tooling, or dependency differentiation.

Please perform a full git clone of your project into a new folder, this rules out dependencies which are cached locally. Then compile with the same configuration as App Center. 

1. Open your terminal or command line prompt then type in: mkdir appcenterTest
2. Then change directories: cd appcenterTest
3. Clone your repository with: git clone -b your-branch https://your-repo 
4. Then run the same build commands that we are using in App Center. These can be found within the build logs. Where possible, build with command line. Building from an IDE does not ensure you execute the same build steps.
5. If the local build is successful, please collect the local build logs and be prepared to send to App Center Support Team
6. You may want to enable Diagnostic/Verbose logging on the build step to get greater visibility into this process.

## Contacting App Center Support

If you are unable to resolve the build failure following these guides, please help App Center support quickly investigate your build failure by sharing the following information when opening a support ticket at https://appcenter.ms.

1. Share the local build logs from the step 5 mentioned above.
2. Provide the full App Center URL to the failed build.
3. Answer
    * Did build ever work before? 
    * When did the issue start to happen? 
    * Have you changed anything maybe related before the issue happened?
    * If you revert changes does build succeed?
    * If we require, may we run a debug build of your app?