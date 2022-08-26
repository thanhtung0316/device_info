
import 'device_info_platform_interface.dart';

class DeviceInfo {
  Future<dynamic> getDeviceInfo() {
    return DeviceInfoPlatform.instance.getDeviceInfo();
  }
}
