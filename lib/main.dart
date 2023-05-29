import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import './app/modules/home/view.dart';
import './app/modules/home/binding.dart';
import './app/data/services/storage/services.dart';

void main() async {
  await GetStorage.init();
  //  Below i'm intantiating the get_storage as:
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo List using GetX',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialBinding: HomeBinding(),
      //  I want to show toast either when operation
      //  success or when operation fail therefore,
      //  i'm using package "flutter_easyloading" here.
      builder: EasyLoading.init(),
    );
  }
}
