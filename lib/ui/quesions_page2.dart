import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon2/models/quoshions.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imtihon2/ui/queshions_page3.dart';
// ignore: must_be_immutable
class QuesionPage2 extends StatefulWidget {
  String usr1;
  int rng;
  String usr2;
String usr3;
int ballusr1;
QuesionPage2(this.usr1,this.usr2,this.usr3,this.rng,this.ballusr1);
  @override
  // Parametrlarni opkevoldi

  _QuesionPage2State createState() => _QuesionPage2State();
}

class _QuesionPage2State extends State<QuesionPage2> {
  List showingList = [];

  TextEditingController _controller = TextEditingController();
  int ballusr2 =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      // api ni olib korsitamiz
        body: FutureBuilder(
          future: fetchQueshions(),
          builder: (context, AsyncSnapshot<Quoshions> snap){
            var data = snap.data;
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }else if (snap.connectionState == ConnectionState.done){
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 50,),
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 200,
                        child: Text(data!.results![widget.rng].question.toString()),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10,top: 30),child:
                      InkWell(
                        child:   Container(
                          alignment: Alignment.center,
                          height: 200,
                          width: 180,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.purple,Colors.blue]
                          )),
                          child: Text(data.results![widget.rng].incorrectAnswers.toString()),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => QuesionPage3(widget.usr1,widget.usr2,widget.usr3,widget.rng,widget.ballusr1,ballusr2)));
                        },
                      )
                      ),
                      Padding(padding: EdgeInsets.only(left: 10,top: 30),child:
                      InkWell(
                        child:  Container(
                          alignment: Alignment.center,
                          height: 200,
                          width: 180,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.purple,Colors.blue]
                          )),
                          child: Text(data.results![widget.rng].incorrectAnswers![0].toString()),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => QuesionPage3(widget.usr1,widget.usr2,widget.usr3,widget.rng,widget.ballusr1,ballusr2)));
                        },
                      )
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10,top: 30),child:
                      InkWell(
                        child:    Container(
                          alignment: Alignment.center,
                          height: 200,
                          width: 180,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.purple,Colors.blue]
                          )),
                          child: Text(data.results![widget.rng].correctAnswer!.toString()),
                        ),
                        onTap: (){
                          ballusr2 +=1;
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuesionPage3(widget.usr1,widget.usr2,widget.usr3,widget.rng,widget.ballusr1,ballusr2)));
                        },
                      )
                      ),
                      Padding(padding: EdgeInsets.only(left: 10,top: 30),child:
                      InkWell(
                        child:  Container(
                          alignment: Alignment.center,
                          height: 200,
                          width: 180,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.purple,Colors.blue]
                          )),
                          child: Text(data.results![widget.rng].incorrectAnswers![2].toString()),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => QuesionPage3(widget.usr1,widget.usr2,widget.usr3,widget.rng,widget.ballusr1,ballusr2)));
                        },
                      )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(child: Text(widget.usr2),alignment: Alignment.center,height: 20,width: 330,),
                    ],
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );
  }
  //Api ni olib kelmoqdamiz
  Future<Quoshions> fetchQueshions() async {
    final response = await http.get(Uri.parse("https://opentdb.com/api.php?amount=10"));

    if (response.statusCode == 200){
      return Quoshions.fromJson(jsonDecode(response.body));
    }else {
      throw Exception("Failed to load album");
    }
  }
}
