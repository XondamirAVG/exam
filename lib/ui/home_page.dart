import 'package:flutter/material.dart';
import 'package:imtihon2/ui/quesions_page1.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String usr1 = "";
   String usr2 ="";
   String usr3 ="";
   var myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "username 1",
                suffixIcon: IconButton(
                  splashColor: Colors.white,
                  icon:  Icon(Icons.person),
                onPressed: (){},
                )
            ),
            onChanged: (v){
              usr1 = v;
            },
          ),
          SizedBox(height: 30,),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "username 2",
                suffixIcon: IconButton(
                  splashColor: Colors.white,
                  icon:  Icon(Icons.person),
                  onPressed: () {
                  },
                )
            ),
            onChanged: (v){
              usr2 = v;
            },
          ),
          SizedBox(height: 30,),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "username 3",
                suffixIcon: IconButton(
                  splashColor: Colors.white,
                  icon:  Icon(Icons.person),
                  onPressed: (){},
                )
            ),
            onChanged: (v){
               usr3 = v;
             // debugPrint(usr3);
            },
          ),
          Row(
            children: [
              SizedBox(width: 100,),
              ElevatedButton(onPressed: (){
              if(usr1 == "" && usr2 == "" && usr3 ==""){}else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => QuesionPage1(usr1,usr2,usr3)));
              }
              }, child: Text("Play game"))
            ],
          )
        ],
      ),
    );
  }
}
//5