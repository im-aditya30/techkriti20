import 'package:flutter/material.dart';
import 'package:techkriti20/data/model/data_models.dart';
import 'package:techkriti20/pages/event_list/event_list.dart';
// import 'package:techkriti20/shared/coming_soon.dart';
import 'package:techkriti20/utils/globals.dart';


class EventRouter extends StatefulWidget {
  final String name;
  EventRouter({@required this.name});
  @override
  _EventRouterState createState() => _EventRouterState();
}

class _EventRouterState extends State<EventRouter> {

  bool _loadingState = true;
  Category _pageData;
  bool displaySoon = false;

  @override
  void initState() {
    super.initState();
    _loadingState = true;
    // if(populateData(widget.name)){
       
    // }
    populateData(widget.name).then((c) {
      _pageData = c;
      print(_pageData);
      if (this.mounted == true) {
        setState(() {
          _loadingState = false;
          
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // if(displaySoon){
    //   return ComingSoon(widget.name);
    // }
    return EventList(head: widget.name,category: null, loadingState: _loadingState,eventList: null,);
  }
}


// case CATEGORY.COMPETITIONS:
//           return CategoryList(_pageData);
//           break;
//         case CATEGORY.SUMMIT:
//          return SummitHome();
//           // return ComingSoon();
//           break;
//         case CATEGORY.HOSPITALITY:
//           // return HospitalityList(_pageData);
//           return CategoryList(_pageData);
//           break;
//         case CATEGORY.WORKSHOPS:
//           // return ComingSoon();
//          return CategoryList(_pageData);
//           break;
//         case CATEGORY.TALKS:
//           return ComingSoon();
// //          return TalkScreen(_pageData);
//           break;
//         case CATEGORY.SHOWS:
//           return ComingSoon();
//           break;
//         case CATEGORY.SCHEDULE:
//           return Schedule();