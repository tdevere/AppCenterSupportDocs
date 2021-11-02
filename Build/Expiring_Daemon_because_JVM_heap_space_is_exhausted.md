# Expiring Daemon because JVM heap space is exhausted

## Discussion
If the Gradle Task build step includes line(s) with the following details
* ` java.lang.OutOfMemoryError `
* ` Expiring Daemon because JVM heap space is exhausted` 
* ` Daemon will be stopped at the end of the build after running out of JVM memory`

Then you are likely in one of these situations        
* JVM has run out of native memory
* Java heap is out of memory

## Explanation
In some cases you can run out of free memory while the JVM is running. If the JVM requires more memory for its internal operation but could not enough, it will terminate and/or throw an error.        

## Solution
Add following line to your android/gradle.properties file:                   
``` 
// app/build.gradle
dexOptions { javaMaxHeapSize "3g" }
// gradle.properties
org.gradle.jvmargs=-Xmx4g -XX:MaxPermSize=2048m  -XX:+HeapDumpOnOutOfMemoryError-Dfile.encoding=UTF-8 
```

* Push these changes to repo
* Update your build configurations via App Center portal and Click Save and Build to test 

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)