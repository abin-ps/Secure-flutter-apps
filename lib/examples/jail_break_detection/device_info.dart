import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  get() async {
    return '''
                board: ${(await _deviceInfo.androidInfo).board} \n
                <------------------------END---------------------------->\n\n
                bootloader: ${(await _deviceInfo.androidInfo).bootloader} \n
                <------------------------END---------------------------->\n\n
                brand: ${(await _deviceInfo.androidInfo).brand} \n
                <------------------------END---------------------------->\n\n
                device: ${(await _deviceInfo.androidInfo).device} \n
                <------------------------END---------------------------->\n\n
                display: ${(await _deviceInfo.androidInfo).display} \n
                <------------------------END---------------------------->\n\n
                fingerprint: ${(await _deviceInfo.androidInfo).fingerprint} \n
                <------------------------END---------------------------->\n\n
                hardware: ${(await _deviceInfo.androidInfo).hardware} \n
                <------------------------END---------------------------->\n\n
                host: ${(await _deviceInfo.androidInfo).host} \n
                <------------------------END---------------------------->\n\n
                id: ${(await _deviceInfo.androidInfo).id} \n
                <------------------------END---------------------------->\n\n
                isLowRamDevice: ${(await _deviceInfo.androidInfo).isLowRamDevice} \n
                <------------------------END---------------------------->\n\n
                isPhysicalDevice: ${(await _deviceInfo.androidInfo).isPhysicalDevice} \n
                <------------------------END---------------------------->\n\n
                manufacturer: ${(await _deviceInfo.androidInfo).manufacturer} \n
                <------------------------END---------------------------->\n\n
                model: ${(await _deviceInfo.androidInfo).model} \n
                <------------------------END---------------------------->\n\n
                product: ${(await _deviceInfo.androidInfo).product} \n
                <------------------------END---------------------------->\n\n
                serialNumber: ${(await _deviceInfo.androidInfo).serialNumber} \n
                <------------------------END---------------------------->\n\n
                supported32BitAbis: ${(await _deviceInfo.androidInfo).supported32BitAbis} \n
                <------------------------END---------------------------->\n\n
                supported64BitAbis: ${(await _deviceInfo.androidInfo).supported64BitAbis} \n
                <------------------------END---------------------------->\n\n
                supportedAbis: ${(await _deviceInfo.androidInfo).supportedAbis} \n
                <------------------------END---------------------------->\n\n
                systemFeatures: ${(await _deviceInfo.androidInfo).systemFeatures} \n
                <------------------------END---------------------------->\n\n
                tags: ${(await _deviceInfo.androidInfo).tags} \n
                <------------------------END---------------------------->\n\n
                type: ${(await _deviceInfo.androidInfo).type} \n
                <------------------------END---------------------------->\n\n
                version: ${(await _deviceInfo.androidInfo).version} \n
                data: ${(await _deviceInfo.androidInfo).data} \n     
    ''';
  }
}
