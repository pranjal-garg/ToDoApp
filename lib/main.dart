import 'package:flutter/material.dart';
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

class DashBoardState extends State<DashBoardScreen>{
  List<String> arrNames = ["Abhiram","Pranjal","Yatindra"];
  List<bool?> checked = [false, false, false];
  List<String> status = ["Incomplete","Incomplete","Incomplete"];
  List<Color> col = [Colors.black,Colors.black,Colors.black];
  List<TextDecoration> textDecoration = [TextDecoration.none,TextDecoration.none,TextDecoration.none];
  bool? isChecked = false;
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
                              child: CheckboxListTile(activeColor: Colors.blue,
                                                      secondary: Text(status[index]) ,
                                                      controlAffinity:ListTileControlAffinity.leading,
                                                      title: Text(arrNames[index], style: TextStyle(color: col[index],fontWeight: FontWeight.w700,decoration: textDecoration[index],decorationThickness: 3.0),),
                                                      subtitle:Text("Alphabet"),
                                                      value: checked[index],
                                                      onChanged: (bool? v) => update(v, index)
                                                      ),
                              );
                },itemCount: arrNames.length,)
                )

            )
          ],

        )
    );
  }

  void update(bool? change, int i)
  {
    if(change == true)
    {
      arrNames.add(arrNames[i]);
      arrNames.removeAt(i);
      checked.add(true);
      checked.removeAt(i);
      status.add("Completed");
      status.removeAt(i);
      col.add(Colors.blue);
      col.removeAt(i);
      textDecoration.add(TextDecoration.lineThrough);
      textDecoration.removeAt(i);
    }
    else
      {
          arrNames.insert(0, arrNames[i]);
          checked.insert(0, false);
          status.insert(0, "Incomplete");
          col.insert(0, Colors.black);
          textDecoration.insert(0, TextDecoration.none);

          arrNames.removeAt(i + 1);
          checked.removeAt(i + 1);
          status.removeAt(i + 1);
          col.removeAt(i + 1);
          textDecoration.removeAt(i + 1);
      }

    setState(() {});
  }
  void newTask()
  {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Add New", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          content: Container(
            child: TextField(decoration: InputDecoration(
                hintText: "Enter Task Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(11), borderSide: BorderSide(color: Colors.blue)),
            ),
                autofocus: true,),

          ),
          actions: [
            TextButton(onPressed:(){}, child: Text("SUBMIT"))
          ],


    ));
  }
  }


