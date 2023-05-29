import 'package:get/get.dart';

import '../../data/providers/task/provider.dart';
import './controller.dart';
import '../../data/services/storage/repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}
