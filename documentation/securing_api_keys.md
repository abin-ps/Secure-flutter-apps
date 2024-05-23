# SECURING API KEYS IN FLUTTER


## Dependencies  

```yaml
flutter_dotenv: ^5.1.0
```

## Create and add `.env` file to the project

- Open project root directory and create a file name called `.env` in it.
- example contents:   
>    GOOGLE_MAP_API_KEY="YOUR API KEY HERE"
   > MY_SECRET_KEY="This is my secret key"
- you can check this file for clarification.
## Specify on `.gitignore` file

- For the demonstration I'll not add the `.env` file to `.gitignore` file. But it is mandatory to do.
- Open `.gitignore` file from the project root directory, and add the following at the end.
>    #Environment variables  
  >  .env

## Accessing content from project files:
- To load API KEYS from the `.env` file
- For that,
##### `load_api_keys.dart`
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart'; //package import

  

class APIKeys { //class that manage loading API keys and seting getters.
	Future<void> loadFromEnv() async {
		// this will load file contents. we need to call it from main method.
		await dotenv.load(fileName: ".env");
	}
	//defining googleMapAPIKey getter.
	String? get googleMapAPIKey => dotenv.env["GOOGLE_MAP_API_KEY"];
	//
	String? get secretKey => dotenv.env["MY_SECRET_KEY"];
}
```

- Initialize it from the main method,
##### `main.dart`
```dart
Future<void> main() async {
	APIKeys().loadFromEnv();//load api keys
	runApp(const MyApp());
}
```

- accessing it on the project files,
##### `example.dart`
```dart
Text(
	"Google Map API key: ${APIKeys().googleMapAPIKey ?? ''}", //in this way we can access the API keys on project files.
	style: textStyle,
),
```

## Loading API KEYS on `AndroidManifest.xml` file:

- Loading API Keys directly on `AndroidManifest.xml` file is not possible. 
- But we can load it from `build.gradle` file and pass it to `AndoridManifest.xml` file.
- To do that, 
	- Open app level `build.gradle` file
	- add following before `android{}` block. (don't forgot to replace with your file name.)
##### `android/app/build.gradle`
```groovy
task loadEnv{
	def projectRootDir = rootProject.projectDir.parentFile
	def env = file("$projectRootDir/.env").readLines().collectEntries{ line ->
		def (key, value) = line.tokenize('=')
		[(key): value]
	}
	project.ext.set("env", env)
}
```

- This will load `.env` file from project directory, and set the value to env.
- To pass it to `AndroidManifest.xml` file, paste following inside `android{}` block within `defaultConfig{}` block,
##### `android/app/build.gradle`
```groovy
manifestPlaceholders = [
	applicationName: "android.app.Application", //must required - if AndroidManifest file has `android:name="${applicationName}"`.
	mapsApiKey: env["GOOGLE_MAP_API_KEY"] //this way we can pass API keys to Manifest file
]
```

- Accessing value from `AndroidManifest.xml` file
##### `AndroidManifest.xml`
```xml
<meta-data android:name="com.google.android.geo.API_KEY" 
android:value="${mapsApiKey}" />
```
- That's all you can now store API KEYS externally and load it if needed.

## Reference:
+ [Example App](/lib/examples/securing_api_keys/securing_api_keys_example.dart)
+ [Getters and setters in flutter](https://www.cloudhadoop.com/dart-setter-getter-example#:~:text=In%20classes%2C%20Getters%20provide%20an%20access%20to%20read,called%20accessors%2C%20and%20Setters%20are%20known%20as%20Mutators.)
+ [build.gradle basics](https://youtu.be/o0M4f5djJTQ?si=X-M9MlGGNsgiepCK)
+ [create custom task with build.gradle file](https://www.youtube.com/watch?v=2SWgl-OdxDY)


#### Caution: *Don't forgot to add `.env` file entry to `.gitignore` file. and keep it safe.*
