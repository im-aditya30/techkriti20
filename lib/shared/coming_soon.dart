import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:techkriti20/utils/ui_helpers.dart';


class ComingSoon extends StatelessWidget {
  final String head;
  ComingSoon(this.head);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
          // color: Colors.white,
          child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
// //                Image.network(
// //                  'http://www.offwestend.com/files/Sauce%20for%20the%20Goose%20publicity%20image_web.jpg',
// //                ),
//                  Padding(
//                    padding: EdgeInsets.only(top:60.0,bottom:0.0,left:10.0),
                   
//                     child:Row(
//               children: <Widget>[
//                   IconButton(icon: Icon(EvaIcons.arrowIosBack), onPressed: ()=> Navigator.of(context).pop()),
//                   Text(
//                         head,
//                          style: isThemeCurrentlyDark(context)
//                         ? TitleStylesDefault.white
//                         : TitleStylesDefault.black,
//                       ),
                  
//               ],
//             ),
//             ),
                child:Container(
                  margin: head == 'Entrepreneurial Conclave' ? EdgeInsets.only(bottom:size.height/5):EdgeInsets.only(top: size.height / 4),
                  width: size.width / 2,
                  height: size.height / 4,
                  child: Image(
                    image: AssetImage('assets/images/comingsoon.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                // Text(
                //   "Coming Soon".toUpperCase(),
                //   style: Theme.of(context).textTheme.display1.copyWith(
                //         color: Colors.black54,
                //         fontSize: 24,
                //       ),
                //   textAlign: TextAlign.center,
                // ),
              // ],
            // ),
          // ),
        ));
  }
}


class ErrorData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text('Error Loading Content!!!\nPlease Try again Later!!!'
        ,style: BodyStyleMuli.red),
      )
    );
  }
}