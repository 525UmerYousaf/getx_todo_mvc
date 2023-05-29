import '../../models/task.dart';
import '../../providers/task/provider.dart';

//  According to structure of the application.
//  Inside my "repository", I can access "Provider"
class TaskRepository {
  TaskProvider taskProvider;

  TaskRepository({required this.taskProvider});

  List<Task> readTasks() => taskProvider.readTasks();

  void writeTasks(List<Task> tasks) => taskProvider.writeTasks(tasks);
}
