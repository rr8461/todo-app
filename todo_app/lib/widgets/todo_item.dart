//key:value(class).function_name(data) for shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20))
//Icon(Icons.x)
//color:Colors.x
import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatelessWidget {

  final ToDo x;
  final onChanged;
  final onDeleted;

  const TodoItem({super.key,required this.x,required this.onChanged,required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(
            (20),
          ),
        ),
        //padding: EdgeInsets.all(20),
        child: ListTile //scrollable
            (
                onTap: () {
                  onChanged(x);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                //tileColor: Colors.blue,
                leading:  Icon(
                  x.isDone? Icons.check_box:Icons.check_box_outline_blank,
                  size: 20,
                  color: Colors.black,
                ),
                title:Text(
                  x.todoText!, //! indicates not null value
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      decoration: x.isDone? TextDecoration.lineThrough:null),
                ),
                trailing: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: red, borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      onDeleted(x.id);
                    },
                    color: white,
                    iconSize: 18,
                  ),
                )));
  }
}
