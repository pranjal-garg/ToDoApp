import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Task
{
  String name="";
  String dueDate="";
  bool? checked;
  Color? color;
  int? taskID;
  TextDecoration? textDecoration;


  void newTask(String n, String dd, int c, int ID)
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
        List<String> tokens = dueDate.split('/');
        int date = int.parse(tokens[0]);
        int month = int.parse(tokens[1]);
        int year = int.parse(tokens[2]);
        DateTime dateTime = DateTime(year, month, date);
        DateTime instant = DateTime.now();
        if(dateTime.isBefore(instant))
          {
            color = Colors.red;
            textDecoration = TextDecoration.none;
          }
        else
          {
            color = Colors.black;
            textDecoration = TextDecoration.none;
          }
        checked = false;

      }


  }


  
}