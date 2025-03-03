import 'dart:ui';

class Task
{
  String name="";
  String dueDate="";
  bool? checked;
  Color? color;
  TextDecoration? textDecoration;

  void newTask(String n, String dd, bool? c, Color? col, TextDecoration? decoration)
  {
    name = n;
    dueDate = dd;
    checked = c;
    color = col;
    textDecoration = decoration;
  }


  
}