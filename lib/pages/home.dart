import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:techkriti20/shared/drawer.dart';
// import 'package:flip_panel/flip_panel.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:transformer_page_view/parallax.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class DevelopersContent {
  final String imageURL;
  final String name;
  final String designation;
  final String facebookURL;
  final String linkedin;
  final String github;
  final String mailid;
  DevelopersContent(this.imageURL, this.name, this.designation,
      this.facebookURL, this.github, this.linkedin, this.mailid);
}

List<DevelopersContent> developerContent = [
  DevelopersContent(
      'assets/images/team/Aditya.png',
      'Aditya Gupta',
      'Developed By',
      'https://www.facebook.com/solisaditya',
      'https://github.com/im-aditya30',
      '',
      'adtgupta@iitk.ac.in'),
  DevelopersContent('assets/images/team/Nimish.png', 'Nimish Aggarwal',
      'Headed by', '', '', '', '')
];

class _HomeState extends State<Home> {
  ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  List<TableRow> row = List();
  @override
  Widget build(BuildContext context) {
    for (var index in upcoming_event) {
      row.add(TableRow(children: <Widget>[
        Container(
          width: 200,
          height: 200.0,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Card(
            color: Colors.yellow,
            child: Text(index),
          ),
        ),
      ]));
    }

    return Container(
      child: ListView(
        // itemExtent: ,
        children: <Widget>[
          
          Table(
            children: <TableRow>[
              TableRow(
              children:<Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                height:29.0,
                child: Text(
                  'Newsfeed',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontSize: 24.0,
                    letterSpacing: 0.5
                  ),
                )
              )  
              ]
            ),
            TableRow(
              children: <Widget>[
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width - 100,
                  child: TransformerPageView(
                      // loop: true,
                      viewportFraction: 0.8,
                      transformer: new PageTransformerBuilder(
                          builder: (Widget child, TransformInfo info) {
                        var member = developerContent;

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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: new ParallaxImage.asset(
                                    'assets/event/ECDC.jpg',
                                    position: info.position,
                                  ),
                                ),
                                new Positioned(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    color: Colors.black.withOpacity(0.6),
                                    child: new Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        new ParallaxContainer(
                                          child: Text(
                                            'Newsfeed',
                                              // member[info.index].designation,
                                              style: new TextStyle(
                                                  fontSize: 25.0)),
                                          position: info.position,
                                          translationFactor: 300.0,
                                        ),
                                        new SizedBox(
                                          height: 8.0,
                                        ),
                                        // new ParallaxContainer(
                                        //   child: new Text(
                                        //     member[info.index].name,
                                        //     style: ImageTextMontserrat.white,
                                        //   ),
                                        //   position: info.position,
                                        //   translationFactor: 200.0,
                                        // ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        // Container(
                                        //   // width: MediaQuery.of(context).size.width*0.6,
                                        //   alignment: Alignment.bottomCenter,
                                        //   child: Row(
                                        //       mainAxisSize: MainAxisSize.min,
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.spaceAround,
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.end,
                                        //       children: <Widget>[
                                        //         CircleAvatar(
                                        //           radius: 20.0,
                                        //           backgroundColor: Colors.blue,
                                        //           child: new IconButton(
                                        //             icon: SvgPicture.asset(
                                        //               'assets/icons/facebookLogo.svg',
                                        //               color: Colors.white,
                                        //               height: 20.0,
                                        //               width: 20,
                                        //             ),
                                        //             onPressed: () {
                                        //               // launchURL(member[info.index].facebookURL);
                                        //             },
                                        //           ),
                                        //         ),
                                        //         Container(width: 20),
                                        //         CircleAvatar(
                                        //           radius: 20.0,
                                        //           backgroundColor: Colors.blue,
                                        //           child: new IconButton(
                                        //             // icon: SvgPicture.asset(
                                        //             //   'assets/icons/facebookLogo.svg',
                                        //             //   color: Colors.white,
                                        //             //   height: 20.0,
                                        //             //   width: 20,
                                        //             // ),
                                        //             icon: Icon(
                                        //               Icons.mail,
                                        //               color: Colors.white,
                                        //             ),
                                        //             onPressed: () {
                                        //               // launchMail(member[info.index].mailid);
                                        //             },
                                        //           ),
                                        //         ),
                                        //         Container(width: 20),
                                        //         CircleAvatar(
                                        //           radius: 20.0,
                                        //           backgroundColor: Colors.blue,
                                        //           child: new IconButton(
                                        //             icon: SvgPicture.asset(
                                        //               'assets/icons/linkedin.svg',
                                        //               color: Colors.white,
                                        //               height: 20.0,
                                        //               width: 20,
                                        //             ),
                                        //             onPressed: () {
                                        //               // launchURL(member[info.index].linkedin);
                                        //             },
                                        //           ),
                                        //         ),
                                        //         Container(width: 20),
                                        //         CircleAvatar(
                                        //           radius: 20.0,
                                        //           backgroundColor: Colors.blue,
                                        //           child: new IconButton(
                                        //             icon: SvgPicture.asset(
                                        //               'assets/icons/githubLogo.svg',
                                        //               color: Colors.white,
                                        //               height: 20.0,
                                        //               width: 20,
                                        //             ),
                                        //             onPressed: () {
                                        //               // launchURL(member[info.index].github);
                                        //             },
                                        //           ),
                                        //         ),
                                        //       ]),
                                        // )
                                      ],
                                    ),
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
                      itemCount: developerContent.length),
                )
              ],
            ),
            TableRow(
              children:<Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                height:34.0,
                child: Text(
                  'Upcoming Events',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontSize: 24.0,

                  ),
                )
              )  
              ]
            ),
            for (var i in row) i,
            
          ])
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransformerPageView(
        // loop: true,
        viewportFraction: 0.8,
        transformer: new PageTransformerBuilder(
            builder: (Widget child, TransformInfo info) {
          var member = developerContent;

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
                      member[info.index].imageURL,
                      position: info.position,
                    ),
                  ),
                  new Positioned(
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      color: Colors.black.withOpacity(0.6),
                      child: new Column(
                        // mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new ParallaxContainer(
                            child: Text(member[info.index].designation,
                                style: new TextStyle(fontSize: 25.0)),
                            position: info.position,
                            translationFactor: 300.0,
                          ),
                          new SizedBox(
                            height: 8.0,
                          ),
                          new ParallaxContainer(
                            child: new Text(
                              member[info.index].name,
                              style: ImageTextMontserrat.white,
                            ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        // launchURL(member[info.index].facebookURL);
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
                                        // launchMail(member[info.index].mailid);
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
                                        // launchURL(member[info.index].linkedin);
                                      },
                                    ),
                                  ),
                                  Container(width: 20),
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: Colors.blue,
                                    child: new IconButton(
                                      icon: SvgPicture.asset(
                                        'assets/icons/githubLogo.svg',
                                        color: Colors.white,
                                        height: 20.0,
                                        width: 20,
                                      ),
                                      onPressed: () {
                                        // launchURL(member[info.index].github);
                                      },
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
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
        itemCount: developerContent.length);
  }
}

List<String> upcoming_event = [
  'bnkjdd',
  'fgdf',
  'hfgdf',
  'lkjfkl',
  'njfog',
  'kfkb',
  'hfghvisdjbfjsdb',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjbfgjbj',
  'kjfhhg',
  'kjyohitj',
  'wuyteyt',
  'tweyy',
  'yhriuyoie'
];

// class TimeStamp extends StatelessWidget {
//   final digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
//   final bool debugMode = false;
//   DateTime now = DateTime.now();
//   DateTime dDay = DateTime(2020, 3, 19, 0, 0, 0);

//   @override
//   Widget build(BuildContext context) {
//     dDay = (debugMode)
//         ? DateTime(now.year, now.month + 2, now.day, now.hour, now.minute,
//             now.second + 10)
//         : dDay;

//     Duration _duration = dDay.difference(now);

//     return Center(
//         child: SizedBox(
//           height: 64.0,
//           child: FlipClock.reverseCountdown(
//             duration: _duration,
//             digitColor: Colors.white,
//             backgroundColor: Colors.black,
//             digitSize: 30.0,
//             borderRadius: const BorderRadius.all(Radius.circular(3.0)),
//             //onDone: () => print('ih'),
//           ),
//         ),
//       // ),
//     );
//   }
// }
