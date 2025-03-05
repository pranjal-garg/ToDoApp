import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../Task.dart';

class DBHelper
{
  final String tableName = "Tasks";
  final String column_name = "name";
  final String column_taskNumber = "taskNumber";
  final String column_dueDate = "dueDate";
  final String column_checked = "checked";
  DBHelper._();
  static final DBHelper getInstance = DBHelper._();
  Database? myDB;

  Future<Database> getDB() async
  {
    if(myDB!=null)
      {
        return myDB!;
      }
    else
      {
        myDB =  await openDB();
        return myDB!;
      }
  }

  Future<Database> openDB() async
  {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "noteDB.db");
    return await openDatabase(dbPath, onCreate: (db, version) {
      db.execute("CREATE TABLE $tableName ($column_taskNumber INTEGER PRIMARY KEY AUTOINCREMENT, $column_checked BOOLEAN, $column_name TEXT, $column_dueDate TEXT)");
    }, version: 1);
  }

  Future<bool> addTask(String name, String dueDate, bool checked) async
  {
    var db = await getDB();
    int rowsAffected = await db.insert(tableName, {
      column_name:name,
      column_checked: checked,
      column_dueDate: dueDate
    });

    return rowsAffected>0;
  }

  Future<List<Task>> getAllTasks() async
  {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(tableName);
    List<Task> tasks = [];

    for (var row in mData) {
      Task temp = Task();
      int b = row[column_checked];
      String name = row[column_name];
      String dd = row[column_dueDate];
      temp.fetchFromDb(row[column_name], row[column_dueDate], row[column_checked], row[column_taskNumber]);
      tasks.add(temp);
    }
    return tasks;
  }

  Future<bool> updateTask(int taskNumber, bool b) async
  {
    var db = await getDB();
    int rowsAffected = await db.update(tableName, {
      column_checked: b
    }, where:"$column_taskNumber = $taskNumber");
    return rowsAffected>0;
  }

  Future<bool> deleteTask(int taskNumber) async
  {
    var db = await getDB();
    int rowsAffected = await db.delete(tableName, where:"$column_taskNumber = $taskNumber");
    return rowsAffected>0;
  }


}
