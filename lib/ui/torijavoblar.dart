import 'package:flutter/material.dart';
class ToriJavoblar extends StatefulWidget {
  String usr1;
  String usr2;
  String usr3;
  int ballusr1;
  int ballusr2;
  int ballusr3;
  ToriJavoblar(this.usr1,this.usr2,this.usr3,this.ballusr1,this.ballusr2,this.ballusr3);
  @override
  _ToriJavoblarState createState() => _ToriJavoblarState();
}

class _ToriJavoblarState extends State<ToriJavoblar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.blue.shade300,
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(height: 670,width: 500,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.purple,Colors.blue]
          )),
          child: Column(
            children: [
                  SizedBox(height: 150,),
                  Text(widget.usr1.toString()),
                  Text(widget.ballusr1.toString()),
                  SizedBox(height: 30,),
                  Text(widget.usr2.toString()),
                  Text(widget.ballusr2.toString()),
                  SizedBox(height: 30,),
                  Text(widget.usr3.toString()),
                  Text(widget.ballusr3.toString(),)
            ],
          ),),
        ],
      ),
    );
  }
}
