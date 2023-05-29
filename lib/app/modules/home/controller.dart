import 'package:get/get.dart';

import '../../data/models/task.dart';
import '../../data/services/storage/repository.dart';

//  Inside this controller i'm gonna define logic
//  for my tasks application.
class HomeController extends GetxController {
  TaskRepository taskRepository;
  HomeController({required this.taskRepository});

  //  Below I'm initializing the controller for my tasks todo app.
  final tasks = <Task>[].obs;

  @override
  void onInit() {
    //  Whenever my controller gets initialized I will
    //  read all tasks and assign them to "tasks" which
    //  is observable.
    tasks.assignAll(taskRepository.readTasks());
    super.onInit();
  }
}
