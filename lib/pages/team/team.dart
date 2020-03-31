import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techkriti20/data/team.dart';
import 'package:techkriti20/utils/ui_helpers.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TeamPage());
  }
}

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class ImageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TransformerPageView(
        loop: true,
        viewportFraction: 0.8,
        transformer: new PageTransformerBuilder(
            builder: (Widget child, TransformInfo info) {
          var member = team[0]['members'];
          return new Padding(
            padding: new EdgeInsets.fromLTRB(20.0, 20, 20, 20),
            child: new Material(
              elevation: 6.0,
              color: Colors.transparent,
              textStyle: new TextStyle(color: Colors.white),
              // borderRadius: new BorderRadius.circular(100.0),
              child: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: new ParallaxImage.asset(
                      member[info.index]['imageURL'],
                      position: info.position,
                    ),
                  ),
                  /*new DecoratedBox(
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topCenter,
                            colors: [
                              const Color(0xFF000000),
                              const Color(0xFFFFFFFF),
                            ],
                          ),
                        ),
                      )*/
                  new Positioned(
                    child: new Column(
                      // mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new ParallaxContainer(
                          child: new Text(
                            member[info.index]['name'],
                            style: new TextStyle(fontSize: 25.0),
                          ),
                          position: info.position,
                          translationFactor: 300.0,
                        ),
                        new SizedBox(
                          height: 8.0,
                        ),
                        new ParallaxContainer(
                          child: new Text(member[info.index]['designation'],
                              style: new TextStyle(fontSize: 15.0)),
                          position: info.position,
                          translationFactor: 200.0,
                        ),
                        SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width*0.6,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.blue,
                            child: new IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/facebookLogo.svg',
                                color: Colors.white,
                                height: 20.0,
                                width: 20,
                              ),
                              onPressed: () {
                                launchURL(member[info.index]['facebook']);
                              },
                            ),
                          ),
                          Container(width: 20),
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.blue,
                            child: new IconButton(
                              // icon: SvgPicture.asset(
                              //   'assets/icons/facebookLogo.svg',
                              //   color: Colors.white,
                              //   height: 20.0,
                              //   width: 20,
                              // ),
                              icon: Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                launchMail(member[info.index]['mail']);
                              },
                            ),
                          ),
                          Container(width: 20),
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.blue,
                            child: new IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/linkedin.svg',
                                color: Colors.white,
                                height: 20.0,
                                width: 20,
                              ),
                              onPressed: () {
                                launchURL(member[info.index]['linkedin']);
                              },
                            ),
                          ),
                          Container(width: 20),
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.blue,
                            child: new IconButton(
                              // icon: SvgPicture.asset(
                              //   'assets/icons/facebookLogo.svg',
                              //   color: Colors.white,
                              //   height: 20.0,
                              //   width: 20,
                              // ),
                              icon: Icon(Icons.call
                              ,color: Colors.white,),
                              onPressed: () {
                                launchCaller(member[info.index]['phone']);
                              },
                            ),
                          ),
                        ]),
                  )
                      ],
                    ),
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  
                ],
              ),
            ),
          );
        }),
        itemCount: team[0]['members'].length);
  }
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          height: double.infinity,
          color: Colors.black,
          //   decoration: BoxDecoration(
          //   image: DecorationImage(
          //   image: AssetImage("assets/background/background.png"),
          // fit: BoxFit.fill)),// new Padding(
          //padding: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 30.0),
          child: new ImageTest()),
    );
  }
}
