import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techkriti20/pages/schedule/data/schedule.dart';
import 'package:techkriti20/pages/schedule/schedule.dart';
import 'package:techkriti20/utils/colors.dart';
import 'package:techkriti20/widgets/sexy_bottom_sheet.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}
final List<SheetItem> items = [
  SheetItem('assets/icons/rules.png', 'Day1',' ',null),
  SheetItem('assets/icons/rules.png', 'Day2',' ',null),
  SheetItem('assets/icons/rules.png', 'Day3',' ',null),
  // SheetItem('assets/icons/rules.png', 'Icon 4'),
];
class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return TimelinePage(
      title: "Schedule",
    );
  }
}
String checkSpace(String name){
  return name.replaceAll(' ', '-');
}

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage>with SingleTickerProviderStateMixin {
  // final PageController pageController =
  //     PageController(initialPage: 1, keepPage: true);
  // int pageIx = 1;

  
    List<Tab> tabs = List();
    TabController controller;
    // List<Widget> pages = [
    //   timelineMode(),
    //   // timelineMode(TimelinePosition.Center),
    //   // timelineMode(TimelinePosition.Right)
    // ];
    @override
  void initState() {
    super.initState();
    var length = competitions_schedule.length;
  // print('lenght: '  + length.toString());
    // Initialize the Tab Controller
    controller = TabController(length: length, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }
    TabBar getTabBar() {
    for(var i=0;i< competitions_schedule.length;i++){ 
      var cat, data;
    cat = competitions_schedule[i];
                  data = cat['categories'];
         tabs.add(
                  Tab(child: Container(
                    alignment: Alignment.center,
                    height:30.0,
                    // padding: EdgeInsets.only(bottom:5.0),
                    width: MediaQuery.of(context).size.width/6,
                    child: Text(
                        cat['title'],
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Raleway',
                          color: Colors.white,
                        ),
                      ),
                  ),
           ),
         ) ;
    }return TabBar(
      isScrollable: true,
      labelColor: MyColors.black,
        tabs: tabs,
       
      controller: controller,
    );
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> _tabdetails = List();
    for(var i=0 ; i< competitions_schedule.length; i++){
      var cat, data;
    cat = competitions_schedule[i];
                  data = cat['categories'];
      _tabdetails.add(
              SingleChildScrollView(
          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Timeline.builder(
                            shrinkWrap: true,
                            position: TimelinePosition.Left,
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              // final title = competitions_schedule[i]['title'];
                              // final textTheme = Theme.of(context).textTheme;
                              var location = data[index]['title'];
                              location = checkSpace(location.toString());
                              location = "assets/event/" + location.toString() + ".jpg";
                              return TimelineModel(
                                  Card(
                                    margin: EdgeInsets.symmetric(vertical: 16.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0)),
                                    clipBehavior: Clip.antiAlias,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Image.asset(location),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(data[index]['title'],
                                              style: TextStyle(fontSize: 20.0)),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          // Text(
                                          //   data[index][''],
                                          //   style: textTheme.title,
                                          //   textAlign: TextAlign.center,
                                          // ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  position:
                                      /*i % 2 == 0 ? */ TimelineItemPosition
                                          .right /*: TimelineItemPosition.left*/,
                                  // isFirst: i == 0,
                                  // isLast: i == doodles.length,
                                  iconBackground: Colors.cyan,
                                  icon: Icon(Icons.map));
                            }
                            // physics: position == TimelinePosition.Left
                            //         ? ClampingScrollPhysics()
                            //         : BouncingScrollPhysics(),
                            //     position: position
                            // ),
                            //     ],
                            )),
        ),
      );
    }
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: pageIx,
      //     onTap: (i) { pageController.animateToPage(i,
      //         duration: const Duration(milliseconds: 300),
      //         curve: Curves.easeInOut);

      //       },
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.format_align_left),
      //         title: Text("LEFT"),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.format_align_center),
      //         title: Text("CENTER"),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.format_align_right),
      //         title: Text("RIGHT"),
      //       ),
      //     ]),
      // appBar: AppBar(
      //   // toolbarOpacity: 0.0,
      //   title: Text(widget.title),
      //   backgroundColor: Colors.transparent.withOpacity(0.0),
      //   // actions: <Widget>[
      //   //   IconButton(
      //   //     icon: Icon(
      //   //       Icons.arrow_back_ios,
      //   //     ),
      //   //     onPressed: ()=> Navigator.of(context).pop(),

      //   //   )
      //   // ],
      // ),
      // body: PageView(
      //   // onPageChanged: (i) {setState(() { pageIx = i;
      //   // // timelineMode();
      //   // });},
      //   // controller: pageController,
      //   children: timelineMode(),
      // )
      body: Container(
        height: double.infinity,
        color: Colors.black,
        child: Stack(
          children: <Widget> [
                  Padding(
                    // height: 26.0,
                    padding: EdgeInsets.only(top:10.0,bottom:15.0),
                    // width: double.infinity,
                    child: Container(
                      height: 25.0,
                      child: getTabBar())),
                  Padding(
                    padding: EdgeInsets.only(top:40.0),
                                      child: TabBarView(children: _tabdetails,
                    controller: controller,),
                  )
                ]
        )
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/background/background.png"),
          //         fit: BoxFit.fill)),
          // child: Column(
          //   children: <Widget>[
              // child :ListView.builder(
              //   // shrinkWrap: true,
              //   itemCount: competitions_schedule.length,
              //   itemBuilder: (BuildContext context, int i) {
              //     var cat, data;
              //     cat = competitions_schedule[i];
              //     data = cat['categories'];
              //     return Column(children: <Widget>[
              //       Text(
              //         cat['title'],
              //         style: TextStyle(
              //           fontSize: 50.0,
              //           fontFamily: 'Raleway',
              //           color: Colors.white,
              //         ),
              //       ),
                    // Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Timeline.builder(
                    //         shrinkWrap: true,
                    //         position: TimelinePosition.Left,
                    //         itemCount: data.length,
                    //         itemBuilder: (BuildContext context, int index) {
                    //           // final title = competitions_schedule[i]['title'];
                    //           // final textTheme = Theme.of(context).textTheme;
                    //           var location = data[index]['title'];
                    //           location = checkSpace(location.toString());
                    //           location = "assets/event/" + location.toString() + ".jpg";
                    //           return TimelineModel(
                    //               Card(
                    //                 margin: EdgeInsets.symmetric(vertical: 16.0),
                    //                 shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(8.0)),
                    //                 clipBehavior: Clip.antiAlias,
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.all(16.0),
                    //                   child: Column(
                    //                     mainAxisSize: MainAxisSize.min,
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceBetween,
                    //                     children: <Widget>[
                    //                       Image.asset(location),
                    //                       const SizedBox(
                    //                         height: 8.0,
                    //                       ),
                    //                       Text(data[index]['title'],
                    //                           style: TextStyle(fontSize: 20.0)),
                    //                       const SizedBox(
                    //                         height: 8.0,
                    //                       ),
                    //                       // Text(
                    //                       //   data[index][''],
                    //                       //   style: textTheme.title,
                    //                       //   textAlign: TextAlign.center,
                    //                       // ),
                    //                       const SizedBox(
                    //                         height: 8.0,
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               position:
                    //                   /*i % 2 == 0 ? */ TimelineItemPosition
                    //                       .right /*: TimelineItemPosition.left*/,
                    //               // isFirst: i == 0,
                    //               // isLast: i == doodles.length,
                    //               iconBackground: Colors.cyan,
                    //               icon: Icon(Icons.map));
                    //         }
                    //         // physics: position == TimelinePosition.Left
                    //         //         ? ClampingScrollPhysics()
                    //         //         : BouncingScrollPhysics(),
                    //         //     position: position
                    //         // ),
                    //         //     ],
                    //         )),
              //     ]);
              //   },
              // ),
              // SexyBottomSheet(items: items,bottom:0,top: null,)
          //   ],
            
          // )
          ),
    );
  }

  Widget timelineMode(int i) {
    var cat;
    var data;
    // for (var i = 0; i < competitions_schedule.length; i++) {
    cat = competitions_schedule[i];
    data = cat['categories'];
    // return  ListView(
    //   children:<Widget>[
    //   Container(
    //    width: double.infinity,
    //    child: Text(cat['title'],
    //     style: TextStyle(
    //         fontSize: 30.0,
    //       ),),
    //  ),
    return Timeline.builder(
        position: TimelinePosition.Left,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          // final title = competitions_schedule[i]['title'];
          // final textTheme = Theme.of(context).textTheme;
          var location = data[index]['title'];
          location = checkSpace(location.toString());
          location = "assets/" + location.toString() + ".jpg";
          return TimelineModel(
              Card(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(location),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(data[index]['title'],
                          style: TextStyle(fontSize: 20.0)),
                      const SizedBox(
                        height: 8.0,
                      ),
                      // Text(
                      //   data[index][''],
                      //   style: textTheme.title,
                      //   textAlign: TextAlign.center,
                      // ),
                      const SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
              position:
                  /*i % 2 == 0 ? */ TimelineItemPosition
                      .right /*: TimelineItemPosition.left*/,
              // isFirst: i == 0,
              // isLast: i == doodles.length,
              iconBackground: Colors.cyan,
              icon: Icon(Icons.map));
        }
        // physics: position == TimelinePosition.Left
        //         ? ClampingScrollPhysics()
        //         : BouncingScrollPhysics(),
        //     position: position
        // ),
        //     ],
        );
    // );
  }
  // }
}


//   timelineModel(TimelinePosition position) => Timeline.builder(
//       itemBuilder: centerTimelineBuilder,
//       itemCount: doodles.length,
//       physics: position == TimelinePosition.Left
//           ? ClampingScrollPhysics()
//           : BouncingScrollPhysics(),
//       position: position);

//   TimelineModel centerTimelineBuilder(BuildContext context, int i) {
//     final doodle = doodles[i];
//     final textTheme = Theme.of(context).textTheme;
//     return TimelineModel(
//         Card(
//           margin: EdgeInsets.symmetric(vertical: 16.0),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
//           clipBehavior: Clip.antiAlias,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Image.network(doodle.doodle),
//                 const SizedBox(
//                   height: 8.0,
//                 ),
//                 Text(doodle.time, style: textTheme.caption),
//                 const SizedBox(
//                   height: 8.0,
//                 ),
//                 Text(
//                   doodle.name,
//                   style: textTheme.title,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   height: 8.0,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         position:
//             /*i % 2 == 0 ? */TimelineItemPosition.right /*: TimelineItemPosition.left*/,
//         isFirst: i == 0,
//         isLast: i == doodles.length,
//         iconBackground: doodle.iconBackground,
//         icon: doodle.icon);
//   }
// }

// List<TimelineModel> items = [
//       TimelineModel(Placeholder(),
//           position: TimelineItemPosition.random,
//           iconBackground: Colors.redAccent,
//           icon: Icon(Icons.blur_circular)),
//       TimelineModel(Placeholder(),
//           position: TimelineItemPosition.random,
//           iconBackground: Colors.redAccent,
//           icon: Icon(Icons.blur_circular)),
//     ];
//     return Timeline(children: items, position: TimelinePosition.Center);

// class Schedulee extends StatelessWidget {

//   Widget _simpleTimeline(schedule, BuildContext context) {
//     var columnWidgets = <Widget>[];

//     for (var day in schedule) {
//       columnWidgets.add(
//         Container(
//           margin: EdgeInsets.only(bottom: 16, top: 32),
//           child: Center(
//             child: Text(
//               day['title'].toString().toUpperCase(),
//               style: Theme.of(context).textTheme.title.copyWith(
//                 color: Colors.black54,
//                 fontWeight: FontWeight.w600,
//                 decoration: TextDecoration.underline,
//               ),
//             ),
//           ),
//         )
//       );

//       var list = <Widget>[];
//       for (var event in day['events']) {
//         list.add(
//           EventCard(
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.all(2),
//                   child: Text(
//                     event['name'],
//                     style: Theme.of(context).textTheme.body1.copyWith(
//                       color: Colors.black54,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(2),
//                   child: Text(
//                     "Time: ${event['time']}",
//                     style: Theme.of(context).textTheme.caption.copyWith(
//                       color: Colors.black54,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(2),
//                   child: Text(
//                     "Venue: ${event['venue']}",
//                     style: Theme.of(context).textTheme.caption.copyWith(
//                       color: Colors.black54,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 )
//               ],
//             )
//           )
//         );
//       }

//       columnWidgets.add(Timeline(list));
//     }

//     return ListView(
//       padding: EdgeInsets.all(8),
//       children: columnWidgets,
//     );
//   }

//   Widget _timelineCompetitions(BuildContext context) {
//     var columnWidgets = <Widget>[];

//     for (var day in competitions_schedule) {
//       columnWidgets.add(
//         Container(
//           margin: EdgeInsets.only(bottom: 16, top: 32),
//           child: Center(
//             child: Text(
//               day['title'].toString().toUpperCase(),
//               style: Theme.of(context).textTheme.title.copyWith(
//                 color: Colors.black54,
//                 fontWeight: FontWeight.w600,
//                 decoration: TextDecoration.underline,
//               ),
//             ),
//           ),
//         )
//       );

//       var list = <Widget>[];
//       for (var category in day['categories']) {
//         var content = <Row>[];
//         content.add(
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.all(8),
//                   child: Text(
//                     category['title'],
//                     style: Theme.of(context).textTheme.body1.copyWith(
//                       color: Colors.black54,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )
//         );

//         int i = 1;
//         for (var event in category['events']) {
//           content.add(
//             Row(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.all(8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 4),
//                         child: Text(
//                           "$i. ${event['name'].toString()}",
//                         )
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 16),
//                         child: Text(
//                           "Time: ${event['time'].toString()}",
//                           style: Theme.of(context).textTheme.caption.copyWith(
//                             color: Colors.black54,
//                             fontStyle: FontStyle.italic,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 16),
//                         child: Text(
//                           "Venue: ${event['venue'].toString()}",
//                           style: Theme.of(context).textTheme.caption.copyWith(
//                             color: Colors.black54,
//                             fontStyle: FontStyle.italic,
//                           ),
//                         )
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             )
//           );
//           i++;
//         }

//         list.add(
//           EventCard(
//             Column(
//               children: content,
//             )
//           )
//         );
//       }

//       columnWidgets.add(Timeline(list));
//     }

//     return ListView(
//       padding: EdgeInsets.all(8),
//       children: columnWidgets,
//     );
//   }

//   Widget _timelineWorkshops(BuildContext context) {
//     var events = workshops_schedule;
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(8),
//       child: Timeline(
//         List.generate((events.length), (index) {
//           var event = events[index];
//           return EventCard(
//             Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.all(2),
//                     child: Text(
//                       event['name'],
//                       style: Theme.of(context).textTheme.body1.copyWith(
//                         color: Colors.black54,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(2),
//                     child: Text(
//                       "Dates: ${event['time']}",
//                       style: Theme.of(context).textTheme.caption.copyWith(
//                         color: Colors.black54,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(2),
//                     child: Text(
//                       "Venue: ${event['venue']}",
//                       style: Theme.of(context).textTheme.caption.copyWith(
//                         color: Colors.black54,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                   )
//                 ],
//               )
//           );
//         }),
//       ),
//     );
//   }

//   List<Widget> _generateSchedules(BuildContext context) {
//     var widgets = <Widget>[];
//     widgets.add(_simpleTimeline(talks_schedule, context));
//     widgets.add(_timelineCompetitions(context));
//     widgets.add(_timelineWorkshops(context));
//     widgets.add(_simpleTimeline(megaworld_schedule, context));
//     return widgets;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _schedules =_generateSchedules(context);

//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Schedule"),
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           elevation: 0.5,
//           iconTheme: IconThemeData(
//             color: Colors.black38,
//           ),
//           textTheme: Theme.of(context).textTheme.apply(
//             bodyColor: Colors.black54,
//           ),
//           bottom: TabBar(
//             indicatorColor: Colors.black54,
//             isScrollable: false,
//             labelColor: Colors.black54,
//             tabs: <Tab>[
//               Tab(text: "T/S"),
//               Tab(text: "C"),
//               Tab(text: "W"),
//               Tab(text: "M"),
//               // Tab(icon: Icon(Icons.mic)),
//               // Tab(icon: Icon(Icons.compare_arrows)),
//               // Tab(icon: Icon(Icons.book)),
//               // Tab(icon: Icon(Icons.games)),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: _schedules,
//         ),
//       ),
//     );
//   }
// }

// class EventCard extends StatelessWidget {
//   final Widget content;
//   EventCard(this.content);

//   @override
//   Widget build(BuildContext context) {
//     // var size =MediaQuery.of(context).size;
//     return Card(
//       color: Colors.white,
//       elevation: 0.5,
//       margin: EdgeInsets.all(8),
//       child: Container(
//         // width: size.width * 0.7,
//         padding: EdgeInsets.all(16),
//         child: content,
//       ),
//     );
//   }
// }

// class Timeline extends StatelessWidget {
//   final List<Widget> children;

//   Timeline(this.children);

//   Row _generateRow(Widget w) {
//     return Row(
//       children: <Widget>[
//         Container(
//           child: Icon(
//             Icons.star,
//             color: Colors.blueAccent,
//           ),
//         ),
//         Expanded(child: w)
//       ]
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var size = MediaQuery.of(context).size;
//     return Container(
//       // height: size.height * 0.75,
//       // decoration: BoxDecoration(
//       //   border: Border.all(),
//       // ),
//       child: Stack(
//         children: <Widget>[
//           // Container(
//           //     width: 5,
//           //     color: Colors.blueAccent,
//           //     // height: size.height,
//           //     // margin: EdgeInsets.all(8),
//           //   ),
//           Column(
//             children: List.generate(children.length, (index) {
//               return _generateRow(children[index]);
//             }),
//           ),
//         ]
//       ),
//     );
//   }
// }
