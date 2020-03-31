import 'package:flutter/material.dart';
// import 'package:mongo_dart/mongo_dart.dart';
import 'package:techkriti20/data/data.dart';
// import 'package:techkriti20/pages/event_list/catalog/catalogclick.dart';
import 'package:techkriti20/utils/colors.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:techkriti20/utils/ui_helpers.dart';
import 'package:techkriti20/widgets/sexy_bottom_sheet.dart';
import 'package:techkriti20/widgets/sexy_tile.dart';

// class CustomDialogBox extends StatefulWidget {
//   @override
//   _CustomDialogBoxState createState() => _CustomDialogBoxState();
// }

// class _CustomDialogBoxState extends State<CustomDialogBox> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class CustomDialog extends StatelessWidget {
  final String title, image;
  // final Image image;
  final List<SheetItem> item;

  CustomDialog({
    @required this.title,
    @required this.item,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        
        //...bottom card part,
        Container(
            width: 540.0,
            height: 450.0,
            padding: EdgeInsets.only(
              top: Consts.avatarRadius + Consts.padding,
              bottom: Consts.padding +12,
              left: Consts.padding,
              right: Consts.padding,
            ),
            margin: EdgeInsets.only(top: Consts.avatarRadius,bottom: Consts.avatarRadius),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            // child: Column(
            //   // mainAxisSize: MainAxisSize., // To make the card compact
            //   children: <Widget>[
            //     Text(
            //       title,
            //       style: TextStyle(
            //         fontSize: 24.0,
            //         fontWeight: FontWeight.w700,
            //         color: Colors.black
            //       ),
            //     ),
            //     SizedBox(height: 16.0),
            //     Text(
            //       description,
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontSize: 16.0,
            //         color: Colors.black
            //       ),
            //     ),
            //     // SizedBox(height: 28.0),

            //   ],
            // ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 30.0,
                  child:Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),
                ),
                ),
                item[0].assetName == null ? Expanded(
                                  child: Center(
                    child: Text(item[0].title,style:TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 30.0,
                      color: MyColors.black
                    )),
                  ),
                ) 
                : Expanded(
                  // height: 420.0,
                  child: GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 2.8,
                    children: List.generate(prizeitem.length, (index) {
                      // print(prizeitem[index].title);
                      // print(prizeitem.length);
                      return Stack( children: <Widget>[
                        Hero(
                          tag: 'priz$index', //using a different hero widget tag for
                          // each page mapped to the page's index value
                          child: SexyTile(),
                        ),
                        Container(
                            width: double.infinity,
                            height: 350,
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
                                      item[index].assetName == null ?SizedBox(): ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        child: Image.asset(
                                         item[index].assetName,
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
                                          '${item[index].title}',
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
                  ),
                ),
              ],
            )),
        // CatalogClick(padding: EdgeInsets.only(
        //     top: Consts.avatarRadius + Consts.padding,
        //     bottom: Consts.padding,
        //     left: Consts.padding,
        //     right: Consts.padding,
        //   ),
        //   margin: EdgeInsets.only(top: Consts.avatarRadius),
        //   decoration: new BoxDecoration(
        //     color: Colors.white,
        //     shape: BoxShape.rectangle,
        //     borderRadius: BorderRadius.circular(Consts.padding),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black26,
        //         blurRadius: 10.0,
        //         offset: const Offset(0.0, 10.0),
        //       ),
        //     ],
        //   ),),
        
        //...top circlular image part,
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: Consts.avatarRadius,
              child: Image.asset(image)),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          bottom: Consts.avatarRadius - 25,
          // top: 350.0 + 2 * (Consts.avatarRadius + Consts.padding),
          child: CircleAvatar(
              backgroundColor: Colors.yellow,
              radius: 25.0,
              // alignment: Alignment.bottomCenter,
              child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context).pop())),
        ),
      ],
    );
  }
}
