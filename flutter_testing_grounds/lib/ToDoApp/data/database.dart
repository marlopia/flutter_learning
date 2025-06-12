import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List toDoList = [];

  final _myBox = Hive.box("myBox");

  // first run of app
  void createInitialData () {
    toDoList = [
      ["This is a pending task!", false],
      ["This is a completed task!", true],
      ["You can delete a task by sliding it to the left, try deleting me!", true],
    ];
  }

  //load from db
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update db
  void updateData () {
    _myBox.put("TODOLIST", toDoList);
  }
}