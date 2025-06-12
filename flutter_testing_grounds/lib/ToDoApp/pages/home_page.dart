import 'package:flutter/material.dart';
import 'package:flutter_testing_grounds/ToDoApp/data/database.dart';
import 'package:flutter_testing_grounds/ToDoApp/util/dialog_box.dart';
import 'package:flutter_testing_grounds/ToDoApp/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //call database class
  final _myBox = Hive.box("myBox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // check if first load
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //declare controller for input
  final _controller = TextEditingController();

  // toggle checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // on Save press, add task
  void saveNewTask () {
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  // popup context
  void createNewTask () {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
      );
  }

 // slider context, delete task on press
  void deleteTask (int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged (value,index),
            deleteFunction: (context) => deleteTask (index),
            );
        },
      ),
      backgroundColor: Colors.amber[200],
    );
  }
}