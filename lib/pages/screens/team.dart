import 'package:flutter/material.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:techkriti20/widgets/sexy_tile.dart';
import 'package:http/http.dart'as http;
import 'package:http_parser/http_parser.dart';
import 'dart:async';
import 'dart:convert';


class Team extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: TeamPage()
    );
  }
}


Future<String> getData() async{
  var response = await http.get('https://swapi.co/api/planets/');
  print(response.body);
}

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> with TickerProviderStateMixin {
  AnimationController _controller;
  bool reverse = false;
  var period;
  var result = getData();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    _controller.stop(canceled :!reverse);
    
    _controller.repeat(reverse: reverse, period: period = Duration(milliseconds: 100));
    setState(() {
      if(period == 100 && reverse){
        reverse = false;
        period = 0;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
            height: double.infinity,
            color:Colors.yellow,
        child: Center(
          child: Container(
            width:340.0,
            height: 420.0,
            child: Stack(
              // alignment: Alignment.center,
              children: <Widget>[
                // SexyTile(
                //   color: Colors.yellow,child: Text('something',style: HeadingStylesDefault.black,)),
                
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 340.0,
                    height: 400.0,
                    color: Colors.white,
                  ),
                ),
                Align(
                  // left: 50.0,
                  alignment: Alignment.topCenter,
                  // height: 100.0,
                  // top:150.0,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        reverse = !reverse;
                      });
                    },
                                      child: ScaleTransition(
              scale: Tween(begin: 0.75, end: 0.9)
                .animate(CurvedAnimation(
                    parent: _controller, 
                    curve: Curves.elasticOut
                )
              ),
              child: Container(
                        height:80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(80.0)
                        ), child: Align(alignment:Alignment.topCenter, 
                        child: Icon(Icons.keyboard_arrow_up,size: 50.0,color: Colors.pink,))),
                    ),
                  ),),
              ],
            ),
          ),
        ),

      );
  }
}