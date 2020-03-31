import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:techkriti20/pages/event_list/event_list.dart';
import 'package:techkriti20/utils/globals.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:techkriti20/utils/ui_helpers.dart';
import 'package:techkriti20/widgets/loading.dart';


class Hospitality extends StatefulWidget {
  @override
  _HospitalityState createState() => _HospitalityState();
}

class _HospitalityState extends State<Hospitality> {
//   bool loading = true;
//    startTime() async {
//     var _duration = new Duration(seconds: 2);
//     return new Timer(_duration, navigationPage);
//   }
//   void navigationPage() {
//   Navigator.of(context).push(MaterialPageRoute(builder: (context){return EventList(head: 'Hospitality',loadingState: false);}));
// }
// @override
// void initState() {
//   super.initState();
//   startTime();
  
// }
  @override
  Widget build(BuildContext context) {
    populateData('Hospitality');
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Padding(
            //        padding: EdgeInsets.only(top:60.0,bottom:0.0,left:10.0),
                   
            //         child:Row(
            //   children: <Widget>[
            //       IconButton(icon: Icon(EvaIcons.arrowIosBack), onPressed: ()=> Navigator.of(context).pop()),
            //       Text(
            //             'Hospitality',
            //              style: isThemeCurrentlyDark(context)
            //             ? TitleStylesDefault.white
            //             : TitleStylesDefault.black,
            //           ),
                  
            //   ],
            // ),
            // ),
            EventList(head: 'Hospitality',loadingState: false,eventList: null,)
            // Loading(),s
          ]
      )
      
    );
  }
}