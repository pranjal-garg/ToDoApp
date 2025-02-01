import 'package:flutter/material.dart';

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
  var arrNames = ["Hi","Hello","Bye"];
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('ToDo App',style: TextStyle(color: Colors.white, fontSize: 18),),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: (){},
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
                        Text("02, February 2025",style: TextStyle(color: Colors.white,fontSize: 16),),
                      )
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 4,
                child: Container(child: ListView.builder(itemBuilder:(context, index) {
                  return ListTile(
                      leading: Text('$index'),
                      title: Text(arrNames[index]),
                      subtitle: Text("Completed"),
                      trailing: Checkbox(value:isChecked, onChanged: (newBool){isChecked=true;}),
                  );
                },itemCount: arrNames.length,)
                )

            )
          ],

        )
    );
  }
  }


