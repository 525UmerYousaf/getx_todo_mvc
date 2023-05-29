import 'dart:convert';
import 'package:get/get.dart';

import '../../../core/utils/keys.dart';
import '../../models/task.dart';
import '../../services/storage/services.dart';

//  According to defined MVC architecture my Provider has
//  direct access to the local storage system.
class TaskProvider {
  final _storage = Get.find<StorageService>();

  //  Inside local storage of device the data is stored
  //  in following manner:-
  /*
  {
    'tasks' : [
      {
        'title' : 'Work',
        'color' : '#ff123456',
        'icon' : 0xe123
      }
    ]
  }
  */
  //  Below function will read all tasks from local
  //  storage and return them as a list of "tasks".
  List<Task> readTasks() {
    var tasks = <Task>[];
    //  Below i'm using my 'taskKey' against whose
    //  value all of my list of Tasks are stored as
    //  an array of JSON inside local directory.
    //  I'm using my 'taskKey' value to read & then
    //  convert those JSON list of objects into Dart
    //  objects so, I can use them inside my app by
    //  using "fromJSON" method after that I add all
    //  of my "Task" list of objects into "tasks" &
    //  I return all of the tasks I stored insdie my
    //  local directory.
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  //  Below method is used to write list of tasks to
  //  device local storage.
  void writeTasks(List<Task> tasks) {
    //  Below by default i'm calling "toJSON" method
    //  to convert all of my "Task" objects into Json
    //  objects so, I can store them inside device local
    //  storage.
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
