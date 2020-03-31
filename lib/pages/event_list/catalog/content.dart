// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// // import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:flutter/material.dart';
// // import 'package:line_icons/line_icons.dart';
// import 'package:techkriti20/data/model/data_models.dart';
// import 'package:techkriti20/shared/html.dart';
// import 'package:techkriti20/utils/text_styles.dart';
// // import 'package:techkriti20/utils/ui_helpers.dart';

// // import 'package:google_nav_bar/google_nav_bar.dart';

// class CreateContent extends StatefulWidget {
//   final Event event;
//   final List<Event> eventList;
//   CreateContent({Key key, this.title,this.event,this.eventList}) : super(key: key);

//   final String title;

//   @override
//   _CreateContentState createState() => _CreateContentState();
// }

// // NavBarItem{
// //   // final String title;
  
// // }

// // final List<NavBarItem> navBarItem = [

// // ];
// List<String> icons = [
  
// ];
// class _CreateContentState extends State<CreateContent> {
//   // int selectedIndex = 0;

//   // List<GButton> tabs = new List();
//   // List<Color> colors = [
//   //   Colors.purple,
//   //   Colors.pink,
//   //   Colors.amber[600],
//   //   Colors.teal
//   // ];
//   int _currentIndex = 0;
//   PageController _pageController;
// int currentIndex = 0;
//   int _counter = 0;

//   // void _incrementCounter() {
//   //   setState(() {
//   //     _counter++;
//   //   });
//   // }
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//   // @override
//   // void initState() {
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     bool showTab  = (widget.event == null && widget.eventList != null)? false :widget.event.content.length == 1;
//     var eventcontent = (widget.event == null && widget.eventList != null) ? null : widget.event.content ;
//     return Scaffold(
//       bottomNavigationBar: showTab ? null:  BottomNavyBar(
//         currentIndex: _currentIndex,
//         onItemSelected: (index) {
//           setState(() => _currentIndex = index);
//           _pageController.jumpToPage(index);
//         },
//         items: <BottomNavyBarItem>[
//           BottomNavyBarItem(title: Text('Item One'), icon: Icon(Icons.home)),
//           BottomNavyBarItem(title: Text('Item One'), icon: Icon(Icons.apps)),
//           BottomNavyBarItem(
//               title: Text('Item One'), icon: Icon(Icons.chat_bubble)),
//           BottomNavyBarItem(
//               title: Text('Item One'), icon: Icon(Icons.settings)),
//         ],
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//                    padding: EdgeInsets.only(top:60.0,bottom:0.0,left:10.0),
                   
//                     child:Row(
//               children: <Widget>[
//                   IconButton(icon: Icon(EvaIcons.arrowIosBack), onPressed: ()=> Navigator.of(context).pop()),
//                   Container(
//                     width: MediaQuery.of(context).size.width-40,
//                     child: FittedBox(
//                       alignment: Alignment.centerLeft,
//                       fit: BoxFit.scaleDown,
//                                         child: Text(
//                             widget.title,
                            
//                             maxLines: 1,
//                             //  style: isThemeCurrentlyDark(context)
//                             // ? TitleStylesDefault.white
//                              style: TitleStylesDefault.black,
//                           ),
//                     ),
//                   ),
                  
//               ],
//             ),
//             ),
//           Expanded(
//             child: showTab?  
//               ListView(
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: CustomHtml(
//             data: eventcontent[0].htmlContent,
          
//             ),
//                   ),
//                 ],
//               )
//             : 
//             PageView(
//               controller: _pageController,
//               onPageChanged: (index) {
//                 setState(() => _currentIndex = index);
//               },
//               children: <Widget>[
//                 for(var i =0; i< eventcontent.length;i++) Container(
//                   child: ListView(
//                     children:<Widget> [
//                       CustomHtml(data: eventcontent[i].htmlContent),
//                     ]
//                   )
//                  ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//     // backgroundColor: Colors.white,
//     // body: AnimatedContainer(
//     //   duration: Duration(milliseconds: 300),
//     //   color: colors[selectedIndex],
//     //   child: Center(
//     //     child: Container(
//     //       decoration: BoxDecoration(color: Colors.white, boxShadow: [
//     //         BoxShadow(
//     //             spreadRadius: -10,
//     //             blurRadius: 60,
//     //             color: Colors.black.withOpacity(.20),
//     //             offset: Offset(0, 15))
//     //       ]),
//     //       child: Align(
//     //         alignment: Alignment.bottomCenter,
//     //         // padding:
//     //         //     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
//     //         child: GNav(
//     //             gap: 8,
//     //             color: Colors.grey[800],
//     //             activeColor: Colors.purple,
//     //             iconSize: 24,
//     //             tabBackgroundColor: Colors.purple.withOpacity(0.1),
//     //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//     //             duration: Duration(milliseconds: 1000),
//     //             tabs: [
//     //               GButton(
//     //                 icon: LineIcons.home,
//     //                 text: 'Home',
//     //               ),
//     //               GButton(
//     //                 icon: LineIcons.heart_o,
//     //                 text: 'Likes',
//     //               ),
//     //               GButton(
//     //                 icon: LineIcons.search,
//     //                 text: 'Search',
//     //               ),
//     //               GButton(
//     //                 icon: LineIcons.user,
//     //                 text: 'Profile',
//     //               )
//     //             ],
//     //             selectedIndex: selectedIndex,
//     //             onTabChange: (index) {
//     //               print(index);
//     //               setState(() {
//     //                 selectedIndex = index;
//     //               });
//     //             }),
//     //       ),
//     //     ),
//     //   ),
//     // ));
//   }
// }
