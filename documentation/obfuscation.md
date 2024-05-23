
## Update `build.gradle` file
- add `shrinkResources` and `minifyEnabled` flags inside `buildTypes{}`
##### `android/app/build.gradle`
```groovy
buildTypes {
	release {
		shrinkResources true //for shrinking app size
		minifyEnabled true //for obfuscation

		signingConfig signingConfigs.release
	}
}
```

## Run following command to build `.apk`:
- Before running the following command, we need to create folder named `obfuscation` under project directory.
```bash
 flutter build apk --obfuscate --split-debug-info=obfuscation/
```
- This command will generate `.apk` file.