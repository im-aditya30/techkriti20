// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:techkriti20/data/model/data_models.dart';
// import 'package:techkriti20/pages/event_list/catalog/content.dart';
// import 'package:techkriti20/shared/coming_soon.dart';
// import 'package:techkriti20/utils/colors.dart';
// import 'package:techkriti20/utils/globals.dart';
// import 'package:techkriti20/utils/text_styles.dart';
// import 'package:techkriti20/utils/ui_helpers.dart';
// import 'package:techkriti20/widgets/loading.dart';
// import 'package:techkriti20/widgets/sexy_tile.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';


// class EventList extends StatefulWidget {

//   final String head;
//   final Category category;
//   final bool loadingState;
//   final List<Event> eventList;
//   EventList({this.head,this.category,this.loadingState,@required this.eventList});

//   @override
//   _EventListState createState() => _EventListState();
// }
// checkSpace(String name){
//   return name.replaceAll(' ','-');
// }


// class _EventListState extends State<EventList> {
//   var category;
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       category = (widget.category != null) ? widget.category : toCategoryEnum(widget.head);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: invertInvertColorsStrong(context),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             widget.head == 'Hospitality' ? SizedBox() : Padding(
//                    padding: EdgeInsets.only(top:60.0,bottom:0.0,left:10.0),
                   
//                     child:Row(
//               children: <Widget>[
//                   IconButton(icon: Icon(EvaIcons.arrowIosBack), onPressed: ()=> Navigator.of(context).pop()),
//                   Text(
//                         widget.head,
//                          style: isThemeCurrentlyDark(context)
//                         ? TitleStylesDefault.white
//                         : TitleStylesDefault.black,
//                       ),
                  
//               ],
//             ),
          
//             ),

//              widget.loadingState ? Expanded(child: Center(child: Loading())): 
//             (category.subCategories != null) ? buildCategories(context,category.subCategories) :
//             (widget.eventList != null) ? buildEventList(context, widget.eventList) : 
//             (category.events != null) ? buildEvents(context,category.events)
//              : ComingSoon(widget.head),
             
//           ]
//         )
//         )
//     );
//   }
//   buildCategories(context,subCategory){
//     return  Expanded(
//               child: GridView.count(
//                 crossAxisCount: 1,
//                 childAspectRatio: 2.5,
//                 children: List.generate(
//                   subCategory.length,
//                   (index) {
//                     var sub = subCategory[index];
//                     return Stack(
//                       fit: StackFit.expand,
//                       children: <Widget>[
//                         Hero(
//                           tag:
//                               'tile$index', //using a different hero widget tag for
//                           // each page mapped to the page's index value
//                           child: SexyTile(),
//                         ),
//                         Container(
//                           width: double.infinity,
//                           // height:  (MediaQuery.of(context).size.width /5) :null,
//                           margin:EdgeInsets.all(15.0) ,
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               // child: Row(
//                               //   mainAxisAlignment: MainAxisAlignment.center,
//                               //   crossAxisAlignment: CrossAxisAlignment.center,
//                               //   children: <Widget>[
//                                   child:Hero(
//                                     tag: 'title$index',
//                                     child: Material(
//                                       color: Colors.transparent,
//                                       child: ClipRRect(
//                                             child: Stack(
//                                         children: <Widget>[
//                                           // isEvent/* && (widget.head == 'Hospitality' || widget.head == 'Workshops')*/? SizedBox() :Image.asset(
//                                           //     imageurl + '$image' + exten,
//                                           //     width: double.infinity,
//                                           //     // filterQuality: ,
//                                           //     fit: BoxFit.fill,
//                                           //   ),
                                            
//                                           // BackdropFilter(filter: ImageFilter.blur(
//                                           //   sigmaX: 1,
//                                           //   sigmaY: 1,
//                                           // ),
//                                           // child:Container(color: Colors.black.withOpacity(0))),
//                                           Container(
//                                             // color: isEvent && (widget.head == 'Hospitality' || widget.head == 'Workshops')? null : Colors.black.withOpacity(0.6),
//                                             child: Center(
//                                               child: Text(
//                                                 sub.name,
//                                                 style: LabelStyles.white,
//                                                     // : LabelStyles.black,
//                                                 softWrap: true,
//                                                 overflow: TextOverflow.fade,
//                                                 maxLines: 1,
//                                               ),
//                                             ),
//                                           ),
                                          
//                                         ],
//                                       ),
//                                       borderRadius: BorderRadius.circular(15),
//                                           ),
//                                     ),
//                                   ),
//                                 // ],
//                               // ),
//                               splashColor: MyColors.accent,
//                               borderRadius: BorderRadius.circular(15.0),
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) {
//                                         // return CreateContent(title: subEvents.name,event: subEvents,eventList: null,);
//                                       return EventList(eventList: null,head: sub.name,loadingState: false,category: sub,);
//                                       //  else if (index == 1) {
//                             //             return MyGradientsPage();
//                             //           } else if (index == 2) {
//                             //             return MyAboutPage();
//                             //           } else {
//                             //             return null;
//                             //           }
//                                     },
//                                   ),
//                                 );
//                               },
//                             // ),
//                           ),
//                         ),
//                         )
//                       ],
                      
//                     );
//                   },
//                 ),
//               ),
//             );
//   }
//   buildEvents(context, events){
//      Expanded(
//               child: GridView.count(
//                 crossAxisCount: 1,
//                 childAspectRatio: 2.5,
//                 children: List.generate(
//                   category.events.length,
//                   (index) {
//                     var subEvents = events[index];
//                     return Stack(
//                       fit: StackFit.expand,
//                       children: <Widget>[
//                         Hero(
//                           tag:
//                               'tile$index', //using a different hero widget tag for
//                           // each page mapped to the page's index value
//                           child: SexyTile(),
//                         ),
//                         Container(
//                           width: double.infinity,
//                           // height:  (MediaQuery.of(context).size.width /5) :null,
//                           margin:EdgeInsets.all(15.0) ,
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               // child: Row(
//                               //   mainAxisAlignment: MainAxisAlignment.center,
//                               //   crossAxisAlignment: CrossAxisAlignment.center,
//                               //   children: <Widget>[
//                                   child:Hero(
//                                     tag: 'title$index',
//                                     child: Material(
//                                       color: Colors.transparent,
//                                       child: ClipRRect(
//                                             child: Stack(
//                                         children: <Widget>[
//                                           // isEvent/* && (widget.head == 'Hospitality' || widget.head == 'Workshops')*/? SizedBox() :Image.asset(
//                                           //     imageurl + '$image' + exten,
//                                           //     width: double.infinity,
//                                           //     // filterQuality: ,
//                                           //     fit: BoxFit.fill,
//                                           //   ),
                                            
//                                           // BackdropFilter(filter: ImageFilter.blur(
//                                           //   sigmaX: 1,
//                                           //   sigmaY: 1,
//                                           // ),
//                                           // child:Container(color: Colors.black.withOpacity(0))),
//                                           Container(
//                                             // color: isEvent && (widget.head == 'Hospitality' || widget.head == 'Workshops')? null : Colors.black.withOpacity(0.6),
//                                             child: Center(
//                                               child: Text(
//                                                 subEvents.name,
//                                                 style: LabelStyles.white,
//                                                     // : LabelStyles.black,
//                                                 softWrap: true,
//                                                 overflow: TextOverflow.fade,
//                                                 maxLines: 1,
//                                               ),
//                                             ),
//                                           ),
                                          
//                                         ],
//                                       ),
//                                       borderRadius: BorderRadius.circular(15),
//                                           ),
//                                     ),
//                                   ),
//                                 // ],
//                               // ),
//                               splashColor: MyColors.accent,
//                               borderRadius: BorderRadius.circular(15.0),
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) {
//                                         return CreateContent(title: subEvents.name,event: subEvents,eventList: null,);
                                          
//                                       //  else if (index == 1) {
//                             //             return MyGradientsPage();
//                             //           } else if (index == 2) {
//                             //             return MyAboutPage();
//                             //           } else {
//                             //             return null;
//                             //           }
//                                     },
//                                   ),
//                                 );
//                               },
//                             // ),
//                           ),
//                         ),
//                         )
//                       ],
                      
//                     );
//                   },
//                 ),
//               ),
//             );
          
//   }
//   buildEventList(context, eventList){
//      Expanded(
//               child: GridView.count(
//                 crossAxisCount: 1,
//                 childAspectRatio: 2.5,
//                 children: List.generate(
//                   eventList.length,
//                   (index) {
//                     var subEvents = eventList[index];
//                     return Stack(
//                       fit: StackFit.expand,
//                       children: <Widget>[
//                         Hero(
//                           tag:
//                               'tile$index', //using a different hero widget tag for
//                           // each page mapped to the page's index value
//                           child: SexyTile(),
//                         ),
//                         Container(
//                           width: double.infinity,
//                           // height:  (MediaQuery.of(context).size.width /5) :null,
//                           margin:EdgeInsets.all(15.0) ,
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               // child: Row(
//                               //   mainAxisAlignment: MainAxisAlignment.center,
//                               //   crossAxisAlignment: CrossAxisAlignment.center,
//                               //   children: <Widget>[
//                                   child:Hero(
//                                     tag: 'title$index',
//                                     child: Material(
//                                       color: Colors.transparent,
//                                       child: ClipRRect(
//                                             child: Stack(
//                                         children: <Widget>[
//                                           // isEvent/* && (widget.head == 'Hospitality' || widget.head == 'Workshops')*/? SizedBox() :Image.asset(
//                                           //     imageurl + '$image' + exten,
//                                           //     width: double.infinity,
//                                           //     // filterQuality: ,
//                                           //     fit: BoxFit.fill,
//                                           //   ),
                                            
//                                           // BackdropFilter(filter: ImageFilter.blur(
//                                           //   sigmaX: 1,
//                                           //   sigmaY: 1,
//                                           // ),
//                                           // child:Container(color: Colors.black.withOpacity(0))),
//                                           Container(
//                                             // color: isEvent && (widget.head == 'Hospitality' || widget.head == 'Workshops')? null : Colors.black.withOpacity(0.6),
//                                             child: Center(
//                                               child: Text(
//                                                 subEvents.name,
//                                                 style: LabelStyles.white,
//                                                     // : LabelStyles.black,
//                                                 softWrap: true,
//                                                 overflow: TextOverflow.fade,
//                                                 maxLines: 1,
//                                               ),
//                                             ),
//                                           ),
                                          
//                                         ],
//                                       ),
//                                       borderRadius: BorderRadius.circular(15),
//                                           ),
//                                     ),
//                                   ),
//                                 // ],
//                               // ),
//                               splashColor: MyColors.accent,
//                               borderRadius: BorderRadius.circular(15.0),
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) {
//                                         return EventList(head: subEvents.name,eventList: null,loadingState: false,);
                                  
//                                     },
//                                   ),
//                                 );
//                               },
//                             // ),
//                           ),
//                         ),
//                         )
//                       ],
                      
//                     );
//                   },
//                 ),
//               ),
//             );
//   }
// }