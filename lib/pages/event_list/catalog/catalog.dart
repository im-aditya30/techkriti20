//// import 'dart:js';
//
//import 'package:flutter/material.dart';
//import 'package:techkriti20/data/data.dart';
//// import 'package:techkriti20/data/model/data_models.dart';
//// import 'package:techkriti20/pages/event_list/catalog/catalogclick.dart';
//
//// import 'dart:ui';
//
//// import 'package:techkriti20/pages/liquid_page.dart';
//import 'package:techkriti20/utils/colors.dart';
//import 'package:techkriti20/utils/text_styles.dart';
//import 'package:techkriti20/utils/ui_helpers.dart';
//import 'package:techkriti20/widgets/sexy_bottom_sheet.dart';
//import 'package:eva_icons_flutter/eva_icons_flutter.dart';
//// import 'package:flare_flutter/flare_actor.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/rendering.dart';
//
//
//
//
//class Catalog extends StatefulWidget {
//  final subcategory;
//  final int index;
//  final String image;
//  Catalog({this.subcategory,this.index,this.image});
//  @override
//  _CatalogState createState() => _CatalogState();
//}
//
//
//class _CatalogState extends State<Catalog> {
//
//  @override
//  Widget build(BuildContext context) {
//    final double _width = MediaQuery.of(context).size.width;
//    final double _height = MediaQuery.of(context).size.height;
//
//    return Scaffold(
//      backgroundColor: invertColorsMaterial(context),
//      body: WillPopScope(
//        onWillPop: this.handleBackPressed,
//        child: Container(
//          child: Stack(
//            children: <Widget>[
//              Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.only(
//                      left: 10.0,
//                      top: 50.0,
//                    ),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        IconButton(
//                          icon: Icon(EvaIcons.arrowIosBack),
//                          tooltip: 'Go back',
//                          color: invertColorsMild(context),
//                          iconSize: 26.0,
//                          onPressed: () {
//                            Navigator.pop(context);
//                          },
//                        ),
//                        Hero(
//                          tag: 'title0',
//                          child: Material(
//                            color: Colors.transparent,
//                            child: Text(
//                              widget.subcategory.name,
//                              style: isThemeCurrentlyDark(context)
//                                  ? TitleStylesDefault.white
//                                  : TitleStylesDefault.black,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Stack(
//                    children: <Widget>[
//                      Hero(
//                        tag: 'tile0',
//                        child: Container(
//                          height: _height / 1.8,
//                          width: _width / 1.2,
//                          // decoration: BoxDecoration(
//                          //   image: DecorationImage(image: AssetImage('assets/event/ECDC.jpg'),fit: BoxFit.fill)
//                          // ),
//                          margin: EdgeInsets.all(20.0),
//                          child: Material(
//                            color: invertInvertColorsMild(context),
//                            elevation: 5.0,
//                            borderRadius: BorderRadius.circular(10.0),
//                            shadowColor: shadowColor(context),
//                            child:Container(
//                                decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.circular(10.0),
//                                  image: DecorationImage(image: AssetImage('assets/event/ECDC.jpg'),fit: BoxFit.fill)
//                                ),
//                                // child: Image.asset('assets/event/ECDC.jpg',fit: BoxFit.fill)
//                                child: InkWell(
//                              borderRadius: BorderRadius.circular(10.0),
//                              splashColor: invertInvertColorsMaterial(context),
//                              child: null,
//                              onTap: () {
//                                // Navigator.of(context).push(
//                                //   PageRouteBuilder(
//                                //     transitionsBuilder: (
//                                //       BuildContext context,
//                                //       Animation<double> animation,
//                                //       Animation<double> secondaryAnimation,
//                                //       Widget child,
//                                //     ) {
//                                //       return SlideTransition(
//                                //         position: Tween<Offset>(
//                                //           begin: Offset(0.0, 1.0),
//                                //           end: Offset.zero,
//                                //         ).animate(animation),
//                                //         child: SlideTransition(
//                                //           position: Tween<Offset>(
//                                //             begin: Offset.zero,
//                                //             end: Offset(0.0, 1.0),
//                                //           ).animate(secondaryAnimation),
//                                //           child: child,
//                                //         ),
//                                //       );
//                                //     },
//                                //     transitionDuration:
//                                //         Duration(milliseconds: 500),
//                                //     pageBuilder: (BuildContext context,
//                                //             Animation<double> animation,
//                                //             Animation<double>
//                                //                 secondaryAnimation) =>
//                                //         Stack(
//                                //       children: <Widget>[
//                                //         Hero(
//                                //           tag: 'tile0',
//                                //           child: Container(
//                                //             child: Material(
//                                //               color: invertInvertColorsMild(
//                                //                   context),
//                                //               elevation: 5.0,
//                                //               shadowColor: shadowColor(context),
//                                //               child: InkWell(
//                                //                 splashColor:
//                                //                     invertColorsMaterial(
//                                //                         context),
//                                //                 child: null,
//                                //                 onTap: doNothing,
//                                //               ),
//                                //             ),
//                                //           ),
//                                //         ),
//                                //         Center(
//                                //           child: Hero(
//                                //             tag: 'elt1',
//                                //             child: Container(
//                                //               width: 350,
//                                //               height: 350,
//                                //               child: FlareActor(
//                                //                 'assets/flare/card.flr',
//                                //                 animation: 'animation',
//                                //               ),
//                                //             ),
//                                //           ),
//                                //         ),
//                                //         Positioned(
//                                //           bottom: 15.0,
//                                //           right: 15.0,
//                                //           child: FloatingActionButton(
//                                //             heroTag: 'elt2',
//                                //             foregroundColor: MyColors.light,
//                                //             backgroundColor: MyColors.accent,
//                                //             elevation: 5.0,
//                                //             child: Icon(EvaIcons.close),
//                                //             onPressed: () {
//                                //               Navigator.pop(context);
//                                            },
//                                          // ),
//                                        ),
//                                      // ],
//                                    // ),
//                          //         ),
//                          //       );
//                          //     },
//                            ),
//                          ),
//                        ),
//                      ),
//                      Positioned(
//                        bottom: 100.0,
//                        left: 40.0,
//                        child: Text(
//                          'Hello, world!',
//                          // style: isThemeCurrentlyDark(context)
//                             style: SubHeadingStylesMaterial.light
//                              // ?SubHeadingStylesMaterial.dark,
//                        ),
//                      ),
//
//                      Positioned(
//                        bottom: 60.0,
//                        left: 40.0,
//                        child: Hero(
//                          tag: 'elt1',
//                          child: Material(
//                            color: Colors.transparent,
//                            child: Text(
//                              'Click me.',
//                              // style: isThemeCurrentlyDark(context)
//                                  style: HeadingStylesMaterial.light
//                                  // : HeadingStylesMaterial.dark,
//                            ),
//                          ),
//                        ),
//                      ),
//                      Positioned(
//                        top: 40.0,
//                        right: 40.0,
//                        child: Container(
//                          height: 40.0,
//                          width: 40.0,
//                          child: FloatingActionButton(
//                            heroTag: 'elt2',
//                            foregroundColor: MyColors.light,
//                            backgroundColor: MyColors.accent,
//                            elevation: 3.0,
//                            child: Icon(EvaIcons.infoOutline),
//                            onPressed: () {
//
//                              // Navigator.push(
//                              //   context,
//                              //   CupertinoPageRoute(
//                              //     builder: (context) {
//                              //       return MyLiquidPage();
//                              //     },
//                              //   ),
//                              // );
//                            },
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ],
//              ),
//              SexyBottomSheet(items: items,top: null,bottom: 0,), //the awesome sliding up bottom sheet
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  Future<bool> handleBackPressed() {
//    if (isBottomSheetOpen) {
//      toggleBottomSheet();
//      return Future.value(false);
//    }
//    return Future.value(true);
//  }
//}
