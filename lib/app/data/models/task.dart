import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final int icon;
  final String color;
  final List<dynamic>? todos;

  const Task({
    required this.title,
    required this.icon,
    required this.color,
    this.todos,
  });

  //  Below method is used to create a new instance and
  //  replace an existing instance of "Task".
  Task copyWith({
    //  Reason for making below parameters nullable is that
    //  if they aren't passed then thier original value from
    //  original instance will be used.
    String? title,
    int? icon,
    String? color,
    List<dynamic>? todos,
  }) =>
      Task(
        //  Below i'm checking if user has passed an "title"
        //  if user has not passed any 'title' then I use
        //  the original one
        title: title ?? this.title,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        todos: todos ?? this.todos,
      );

  //  Below is my JSON deserialization method to read Task
  //  data from local storage.
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'],
        icon: json['icon'],
        color: json['color'],
        todos: json['todos'],
      );

  //  Below is my JSON serialization method to read Task
  //  data from local storage.
  Map<String, dynamic> toJson() => {
        'title': title,
        'icon': icon,
        'color': color,
        'todos': todos,
      };

  //  below i'm using Equatable package to compare values
  //  of "Task" which is used when comparing two instances
  //  of Task without following they still be compared but
  //  for when two same instances are compared the result
  //  would still be "false" bcz thier address can be diff
  //  so, in order to compare instance based on thier logic
  //  following code is very important.
  @override
  List<Object?> get props => [title, icon, color];
}
