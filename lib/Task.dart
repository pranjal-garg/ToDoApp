import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Task
{
  String name="";
  String dueDate="";
  bool? checked;
  Color? color;
  int? taskID;
  TextDecoration? textDecoration;

  void newTask(String n, String dd, bool? c, Color? col, TextDecoration? decoration)
  {

    name = n;
    dueDate = dd;
    checked = c;
    color = col;
    textDecoration = decoration;
  }

  void fetchFromDb(String n, String dd, int c, int ID)
  {
    name = n;
    dueDate = dd;
    taskID = ID;
    if(c==1)
      {
        checked = true;
        color = Colors.blue;
        textDecoration = TextDecoration.lineThrough;
      }
    else
      {
        checked = false;
        color = Colors.black;
        textDecoration = TextDecoration.none;
      }


  }


  
}