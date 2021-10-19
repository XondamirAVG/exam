import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon2/models/quoshions.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imtihon2/ui/quesions_page2.dart';
// ignore: must_be_immutable
class QuesionPage1 extends StatefulWidget {
 String usr1;
 String usr2;
 String usr3;
 QuesionPage1 (this.usr1,this.usr2,this.usr3);
  @override
  // Parametrlarni opkevoldi

  _QuesionPage1State createState() => _QuesionPage1State();
}

class _QuesionPage1State extends State<QuesionPage1> {
  List showingList = [];

  int ballusr1 =0;
  int rng = Random().nextInt(10);
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
                SizedBox(height: 100,),
                Row(
                  children: [
                    SizedBox(width: 50,),
                    Container(
                      height: 100,
                      width: 200,
                      child: Text(data!.results![rng].question.toString(),maxLines: 2,),
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
                      child: Text(data.results![rng].correctAnswer.toString()),
                    ),
                    onTap: (){
                      ballusr1 +=1;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QuesionPage2(widget.usr1,widget.usr2,widget.usr3,rng,ballusr1)));
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
                     child: Text(data.results![rng].incorrectAnswers![0].toString()),
                   ),
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => QuesionPage2(widget.usr1,widget.usr2,widget.usr3,rng,ballusr1)));
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
                     child: Text(data.results![rng].incorrectAnswers![1].toString()),
                   ),
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => QuesionPage2(widget.usr1,widget.usr2,widget.usr3,rng,ballusr1)));
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
                       child: Text(data.results![rng].incorrectAnswers![2].toString()),
                     ),
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => QuesionPage2(widget.usr1,widget.usr2,widget.usr3,rng,ballusr1)));
                     },
                   )
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    SizedBox(width: 50,),
                    Container(child: Text(widget.usr1),alignment: Alignment.center,height: 20,width: 330,),
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
