import 'package:flutter/material.dart';
import 'package:techkriti20/data/data.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:techkriti20/utils/ui_helpers.dart';
// import 'package:techkriti20/pages/event_list/catalog/catalog.dart';
// import 'package:techkriti20/widgets/sexy_bottom_sheet.dart';
import 'dart:ui';

import 'package:techkriti20/widgets/sexy_tile.dart';


// CatalogClick(this.prizeitem);

//   class CatalogClick extends StatefulWidget {

//     @override
//     _CatalogClickState createState() => _CatalogClickState();
//   }

//   class _CatalogClickState extends State<CatalogClick> {
//     double lerp(double min, double max) => lerpDouble(min, max, controller.value);
//     double get headerTopMargin =>
//       lerp(16, 0 + MediaQuery.of(context).padding.top);
//     double get itemBorderRadius => lerp(8, 15);
//     double iconTopMargin(int index) =>
//       lerp(
//         iconStartMarginTop,
//         iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize),
//       );

//   double iconLeftMargin(int index) =>
//       lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);
//     @override

//   Widget build(BuildContext context){
//     // int index
//     return Container(
//       height: 500.0,
//       width: 400.0,
//       // color: Colors.yellow,
//       child: // item(),
//           ListView.builder(itemBuilder: (BuildContext context, int index){
//             // print(prizeitem[index].title);
//             return Container(
//               height: 500.0,
//               width: 400.0,
//               child: Stack(
//                 // fit: StackFit.expand,
//                 alignment: Alignment.center,
//                 children: <Widget>[
//                   buildIcon(prizeitem[index]),
//                   buildFullItem(prizeitem[index])
//                 ],
//               ),
//             );
//           },
//           itemCount: prizeitem.length,)
//           // for(SheetItem item in prizeitem) buildIcon(item),

//       //   ],

//       // )
//     );
//   }
//   Widget buildIcon(SheetItem item) {
//     int index = prizeitem.indexOf(item);
//     return Positioned(
//       height: 30.0,
//       width: 30.0,
//       top: iconTopMargin(index),
//       left: iconLeftMargin(index),
//       child: Container(
//         padding: EdgeInsets.all(15.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//           child: Image.asset(
//             item.assetName,
//             fit: BoxFit.cover,
//             alignment: Alignment(lerp(0, 0), 0),
//           ),
//         ),
//       ),
//     );
//   }
//   // Widget item(){
//   // for(var i=0 ; i<prizeitem.length ; i++){

//   //           print(prizeitem[i].title.toString());
//   //           print(prizeitem.length);
//   //           return buildFullItem(prizeitem[i]);
//   // }
// // }
//   Widget buildFullItem(SheetItem item) {
//     int index = prizeitem.indexOf(item);
//     // print(item.title);
//     return ExpandedSheetItem(
//       // topMargin: iconTopMargin(index),
//       // leftMargin: iconLeftMargin(index),
//       height: 30.0,
//       isVisible: true,
//       // isVisible: controller.status == AnimationStatus.completed,
//       borderRadius: itemBorderRadius,
//       title: item.title == null ? 'Not Available' : item.title,
//       // screen: ,
//     );
//   }
// }



class CatalogClick extends StatefulWidget {
  final EdgeInsetsGeometry margin;
  final Decoration decoration;
  final EdgeInsetsGeometry padding;
  CatalogClick({this.padding,this.margin,this.decoration});

  @override
  _CatalogClickState createState() => _CatalogClickState();
}

class _CatalogClickState extends State<CatalogClick> {
  
  var iconleft = 16.0;
  var height = 60.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.0,
      height: 340.0,
      padding: widget.padding,
      margin: widget.margin,
      decoration: widget.decoration,
      color: invertInvertColorsMaterial(context),
        child: GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 2.8,
      children: List.generate(prizeitem.length, (index) {
        // print(prizeitem[index].title);
        // print(prizeitem.length);
        return Stack(fit: StackFit.expand, children: <Widget>[
          Hero(
            tag: 'priz0', //using a different hero widget tag for
            // each page mapped to the page's index value
            child: SexyTile(),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.all(15.0),
              child: Material(
                  color: Colors.transparent,
                  // child: Hero(
                  //   tag: 'prize$index',
                    child: Material(
                      color: Colors.transparent,
                      child: SexyTile(
                        
                        color: invertColorsMaterial(context),
          splashColor: invertInvertColorsMaterial(context),
                        child: Stack(
                          
                          children: <Widget>[
                            ClipRRect(
                              
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                child: Image.asset(
                                  
                                  prizeitem[index].assetName,
                                  // width: double.infinity,
                                  // filterQuality: ,
                                  height: 50.0,

                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            // ),

                            // BackdropFilter(filter: ImageFilter.blur(
                            //   sigmaX: 1,
                            //   sigmaY: 1,
                            // ),
                            // child:Container(color: Colors.black.withOpacity(0))),
                            // Positioned(
                            //   left: iconleft + 42.0,
                            //   top: iconleft + iconleft*index,
                            //   height: height,
                            //   width: 90.0,
//  SexyTile(
                                // color: Colors.black.withOpacity(0.6),
                                Center(
                                  child: Text(
                                      '${prizeitem[index].title}',
                                      style: isThemeCurrentlyDark(context)
                      ? SubHeadingStylesMaterial.light
                      : SubHeadingStylesMaterial.dark,
                                      // : LabelStyles.black,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                    ),
                                ),
                                // ),
                              // ),
                            // ),
                          ],
                        ),
                        // borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ))
                  // )
        ]);
      }),
    ));
  }
}
