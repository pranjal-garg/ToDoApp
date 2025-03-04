
import 'package:android/Task.dart';
import 'package:android/data/local/DBHelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

void main()
{
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red

      ),
      home: DashBoardScreen(),
    );
  }

}

class DashBoardScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashBoardState();
  }

}

class DashBoardState extends State<DashBoardScreen>
{
  List<Task> task = [];
  DBHelper? DBRef;

  @override
  void initState()
  {
    super.initState();
    DBRef = DBHelper.getInstance;
    getTasks();
  }

  void getTasks() async
  {
    task = await DBRef!.getAllTasks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('ToDo App',style: TextStyle(color: Colors.white, fontSize: 18),),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: (){ newTask();},
                icon: Padding(padding: EdgeInsets.only(right: 10),child:Icon(Icons.add, color: Colors.white,size: 19,)))
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only(bottomRight: Radius.circular(150))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container( margin: EdgeInsets.only(top:25,left: 20),
                          child:
                          Text("Today",style: TextStyle(color: Colors.white,fontSize: 35),)),
                      Container(
                        margin: EdgeInsets.only(top: 0,left: 20),
                        child:
                        Text(DateFormat.yMMMMd().format(DateTime.now()),style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                      )
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 4,
                child: Container(margin: EdgeInsets.only(top:15, left: 10, right: 10),
                    child: ListView.builder(itemBuilder:(context, index) {
                  return Card(elevation: 2,
                              child: CheckboxListTile(
                                  activeColor: Colors.blue,
                                  secondary: InkWell(onTap: (){deleteTask(index);}, child: Icon(Icons.delete_outline, color: Colors.blue,),),
                                  controlAffinity:ListTileControlAffinity.leading,
                                  title: Text(task[index].name, style: TextStyle(color: task[index].color,fontWeight: FontWeight.w700,decoration: task[index].textDecoration,decorationThickness: 3.0),),
                                  subtitle:Text("Due by: ${task[index].dueDate}"),
                                  value: task[index].checked,
                                  onChanged: (bool? v) => update(v, index)
                              ),
                  );
                    },itemCount: task.length,)
                )

            )
          ],

        )
    );
  }

  void deleteTask(int i)
  {
    task.removeAt(i);
    setState(() {});
  }
  void update(bool? change, int i)
  {
    if(change == true)
    {
      task[i].color = Colors.blue;
      task[i].checked = true;
      task[i].textDecoration = TextDecoration.lineThrough;
      task.add(task[i]);
      task.removeAt(i);
    }
    else
    {
      task[i].checked = false;
      task[i].color = Colors.black;
      task[i].textDecoration = TextDecoration.none;
      task.insert(0, task[i]);
      task.removeAt(i+1);
      }
    setState(() {});
  }
  void newTask()
  {
    var taskName = TextEditingController();
    var taskDate = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Add New Task", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          content: Container(
            margin: EdgeInsets.only(top: 15),
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: taskName,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11),borderSide: BorderSide(color: Colors.blue)),
                    hintText: "Enter Task Title",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(11), borderSide: BorderSide(color: Colors.blue)),
                  ), autofocus: true,),
                Container(height: 10,),
                TextField(
                  readOnly: true,
                  onTap: () async {
                    DateTime? datePicked = await showDatePicker(context: context, initialDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365*10)), firstDate: DateTime.now());
                    taskDate.text = "${datePicked?.day}/${datePicked?.month}/${datePicked?.year}";
                  },
                  controller: taskDate,
                  decoration: InputDecoration(suffixIcon: Icon(Icons.calendar_today),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11),borderSide: BorderSide(color: Colors.blue)),
                    hintText: "Enter Due Date",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(11), borderSide: BorderSide(color: Colors.blue)),
                  ), ),
              ],
            )),
          actions: [
            TextButton(onPressed:(){
              Navigator.pop(context);
            }, child: Text("CANCEL")),
            TextButton(onPressed:(){
              addTaskToDb(taskName.text.toString(), taskDate.text.toString(), false);
              }, child: Text("SUBMIT")),
          ],


        ));
  }

  void addTaskToDb(String n, String dd, bool c) async
  {
    bool? done = await DBRef?.addTask(n, dd, c);
    if(done!)
      {
        getTasks();
        Navigator.pop(context);
      }


  }

  }


