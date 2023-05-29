import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './app/modules/home/view.dart';
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
      home: HomePage(),
    );
  }
}