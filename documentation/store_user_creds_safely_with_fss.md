## Dependencies:  

```yaml
flutter_secure_storage: ^9.2.1 # for storing user credentials on the device itself
choice: ^2.3.2 #choice chips used in secure storage example screen to select user interests
```

## Update Minimum Sdk in `build.gradle` file:

```groovy
minSdkVersion 21 //min sdk version set to be atleast 18 or higher
```

## CRUD operations with secure storage:
##### `secure_storage.dart`
```dart
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
	final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
	
	final String _keyUserName = "username";
	final String _keyInterests = "interests";

	// store new creds
	Future<void> storeUserCreds({
	required String userName, 
	required List<String> interests,
	}) async{
		final String encodedUserInterestsVal = json.encode(interests);
		await _secureStorage.write(key: _keyUserName, value: userName);
		await _secureStorage.write(
			key: _keyInterests, 
			value: encodedUserInterestsVal,
		);
	} //update existing creds done by the same way of adding.
	
	//retreiving user creds
	Future<(String, List<String>)> getUserCreds() async{	
	final String _userName = await _secureStorage.read(key: _keyUserName) ?? "";
	final String encodedUserInterests = await _secureStorage.read(key: _keyInterests) ?? "[]";

	final List<String> userInterests = json.decode(encodedUserInterests);
	return (_userName, userInterests);
	
	}
	
	//deleting user creds
	Future<void> deleteUserCreds() async{	
		await _secureStorage.deleteAll();
	}
	
}
```


## Reference:
- [return multiple values in dart](https://stackoverflow.com/questions/45326310/return-multiple-values-from-function)
- [choice package reference](https://pub.dev/packages/choice)
- [flutter_secure_storage package reference](https://pub.dev/packages/flutter_secure_storage)
