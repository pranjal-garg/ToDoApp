import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper
{
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();
  static final String TABLE_TASK = "task";
  static final String COLUMN_TASK_SNO = "sno";
  static final String COLUMN_TASK_TASKTITLE = "task_title";
  static final String COLUMN_TASK_TASKDESC = "task_description";
  static final String COLUMN_TASK_DUEDATE = "task_due_date";
  static final String COLUMN_TASK_STATUS = "task_status";
  Database? myDB;

  Future <Database> getDB() async
  {
    if (myDB!=null)
      {
        return myDB!;
      }
    else
      {
        myDB = await openDB();
        return myDB!;
      }
  }

  Future <Database> openDB() async
  {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path,"tasksDB.db");
    return await openDatabase(dbPath, onCreate: (db,version){
      db.execute("create table $TABLE_TASK ($COLUMN_TASK_SNO integer primary key autoincrement, $COLUMN_TASK_TASKTITLE title text, $COLUMN_TASK_TASKDESC text, $COLUMN_TASK_DUEDATE text, $COLUMN_TASK_STATUS integer");
    }, version: 1);
  }

  createDB(db,version)
  {
    Database db = getDB();
    
  }

}