# Configure an Alternative EndPoint for App Center SDK

![](/SDK/architecture.png)

## Setup

Configure the App Center SDK

```c#
//Before you call AppCenter.Start, SetLogUrl to override the default App Center ingestion endpoint
AppCenter.SetLogUrl("https://scarbeit-functions-proxy.azurewebsites.net");
//Now you can start App Center SDK
AppCenter.Start("android=xxxx-xxxx-xxxx-xxxx-xxxx;", typeof(Analytics), typeof(Crashes));
```

