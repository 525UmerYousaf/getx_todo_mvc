import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/utils/keys.dart';

//  For my "Services"
class StorageService extends GetxService {
  late GetStorage _box;
  //  Below i'm initializing "GetStorage"
  Future<StorageService> init() async {
    _box = GetStorage();
    await _box.writeIfNull(taskKey, []);
    return this;
  }

  //  Below i'm defining generic-typed function
  //  to store data into my device local directory
  //  Reason for using Generic here is bcz if data
  //  I'm storing is of String-typed Generic type
  //  would be Sting & if storing is of int-typed
  //  Generic type would be int and so on for other.
  T read<T>(String key) {
    return _box.read(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
