import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon2/models/quoshions.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imtihon2/ui/torijavoblar.dart';
// ignore: must_be_immutable
class QuesionPage3 extends StatefulWidget {
  String usr3;
  String usr2;
  String usr1;
  int rng;
  int ballusr1;
  int ballusr2;
  QuesionPage3(this.usr1,this.usr2,this.usr3,this.rng,this.ballusr1,this.ballusr2);
  @override
  // Parametrlarni opkevoldi

  _QuesionPage3State createState() => _QuesionPage3State();
}

class _QuesionPage3State extends State<QuesionPage3> {
  List showingList = [];

  int ballusr3 =0;
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
                        height: 200,
                        width: 100,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ToriJavoblar(widget.usr1,widget.usr2,widget.usr3,widget.ballusr1,widget.ballusr2,ballusr3)));
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
                          child: Text(data.results![widget.rng].correctAnswer!.toString()),
                        ),
                        onTap: (){
                          ballusr3 +=1;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ToriJavoblar(widget.usr1,widget.usr2,widget.usr3,widget.ballusr1,widget.ballusr2,ballusr3)));
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
                          child: Text(data.results![widget.rng].incorrectAnswers![1].toString()),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ToriJavoblar(widget.usr1,widget.usr2,widget.usr3,widget.ballusr1,widget.ballusr2,ballusr3)));
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ToriJavoblar(widget.usr1,widget.usr2,widget.usr3,widget.ballusr1,widget.ballusr2,ballusr3)));
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
                      Container(child: Text(widget.usr3),alignment: Alignment.center,height: 20,width: 330,),
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
