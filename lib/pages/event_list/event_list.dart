import 'dart:ui';
// import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:techkriti20/data/data.dart';
import 'package:techkriti20/data/model/data_models.dart';
// import 'package:techkriti20/pages/event_list/catalog/catalog.dart';
// import 'package:techkriti20/pages/event_list/catalog/content.dart';
import 'package:techkriti20/shared/coming_soon.dart';
import 'package:techkriti20/tabbar/tabbar.dart';
import 'package:techkriti20/utils/colors.dart';
import 'package:techkriti20/utils/globals.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:techkriti20/utils/ui_helpers.dart';
import 'package:techkriti20/widgets/loading.dart';
import 'package:techkriti20/widgets/sexy_tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class EventList extends StatefulWidget {
  final String head;
  final Category category;
  final bool loadingState;
  final List<Event> eventList;
  EventList(
      {this.head, this.category, this.loadingState, @required this.eventList});
  // String head = category.name;
  @override
  _EventListState createState() => _EventListState();
}

checkSpace(String name) {
  return name.replaceAll(' ', '-');
}

// check_buildCompetition()

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    var category = (widget.category != null && widget.eventList == null)
        ? widget.category
        : toCategoryEnum(widget.head);
    // var eventList = (widget.eventList == null )?category.events : ;
    //  bool isCategory = (category.subCategories != null);
    // var builder = (isCategory) ? _categoryBuilder : _eventBuilder;
    // var count = (isCategory) ? category.subCategories.length : category.events.length;
    print('category:' + category.toString());
    var imageurl = 'assets/event/';
    bool isEvent = (widget.head == 'Hospitality' || widget.head == 'Workshops')
        ? category.events != null
        : (widget.eventList != null ? widget.eventList.length != 1 : false);
    // print('category.name' + category.name);
    print('isEvent:' + isEvent.toString());
    // Category subCat = category.subCategories[index];
      return Scaffold(
      backgroundColor: invertInvertColorsStrong(context),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            widget.head == 'Hospitality'
                ? SizedBox()
                : Padding(
                    padding:
                        EdgeInsets.only(top: 60.0, bottom: 0.0, left: 10.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(EvaIcons.arrowIosBack),
                            onPressed: () => Navigator.of(context).pop()),
                        Text(
                          widget.head,
                          style: isThemeCurrentlyDark(context)
                              ? TitleStylesDefault.white
                              : TitleStylesDefault.black,
                        ),
                      ],
                    ),
                  ),
            widget.loadingState
                ? Expanded(child: Center(child: Loading()))
                : (category != null && category.subCategories == null && category.events == null) ? Expanded(child: ErrorData()) : 
                ((!isEvent && category.subCategories[0].name == 'Coming Soon')
                    ? ComingSoon(widget.head)
                    : Expanded(
                        child: GridView.count(
                          crossAxisCount: 1,
                          childAspectRatio: 2.5,
                          children: List.generate(
                            isEvent
                                ? (widget.eventList != null
                                    ? widget.eventList.length
                                    : category.events.length)
                                : category.subCategories.length,
                            (index) {
                              var subEvents = isEvent
                                  ? (widget.eventList != null
                                      ? widget.eventList[index]
                                      : category.events[index])
                                  : null;


                              var subCategory = isEvent
                                  ? null
                                  : category.subCategories[index];
                              bool isCategory = isEvent
                                  ? false
                                  : (subCategory.subCategories != null);
                              var image =
                                  isEvent ? null : checkSpace(subCategory.name);
                              var exten = isEvent
                                  ? null
                                  : (image == 'Entrepreneurial'
                                      ? '.png'
                                      : '.jpg');

                              return Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  Hero(
                                    tag:
                                        'tile$index', //using a different hero widget tag for
                                    // each page mapped to the page's index value
                                    child: SexyTile(),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.all(15.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        child: Hero(
                                          tag: 'title$index',
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ClipRRect(
                                              child: Stack(
                                                children: <Widget>[
                                                  isEvent /* && (widget.head == 'Hospitality' || widget.head == 'Workshops')*/ ? SizedBox()
                                                      : Image.asset(
                                                          imageurl +
                                                              '$image' +
                                                              exten,
                                                          width:
                                                              double.infinity,
                                                          // filterQuality: ,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      // : Image.network(
                                                      //   subCategory.image,
                                                      //   fit: BoxFit.fill,
                                                      // ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                    color:
                                                        isEvent /*&& (widget.head == 'Hospitality' || widget.head == 'Workshops')*/ ? null
                                                            : Colors.black
                                                                .withOpacity(
                                                                    0.6),
                                                    child: Center(
                                                      child: FittedBox(
                                                        // alignment: Alignment.center,
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          isEvent
                                                              ? subEvents.name
                                                              : '${subCategory.name}',
                                                          style: isEvent
                                                              ? (isThemeCurrentlyDark(
                                                                      context)
                                                                  ? TitleStylesDefault
                                                                      .white
                                                                  : TitleStylesDefault
                                                                      .black)
                                                              : TitleStylesDefault
                                                                  .white,
                                                          softWrap: true,
                                                          overflow:
                                                              TextOverflow.fade,
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                        // ],
                                        // ),
                                        splashColor: MyColors.accent,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                print('isEvent:' +
                                                    isEvent.toString());
                                                print(isCategory);
                                                if (!isEvent &&
                                                    subCategory.name ==
                                                        'PUBGM Pan Mania') {
                                                  // print(true);
                                                  return ContentTab(
                                                    title: subCategory.name,
                                                    event:
                                                        subCategory.events[0],
                                                    eventList: null,
                                                  );
                                                }
                                                if (isCategory) {
                                                  return EventList(
                                                      head: subCategory.name,
                                                      category: subCategory,
                                                      eventList: null,
                                                      loadingState: false);
                                                } else if (isEvent) {
                                                  return ContentTab(
                                                    title: subEvents.name,
                                                    event: subEvents,
                                                    eventList: null,
                                                  );
                                                } else {
                                                  print('subCategory: ' +
                                                      subCategory.events
                                                          .toString());
                                                  return EventList(
                                                    head: subCategory.name,
                                                    eventList:
                                                        subCategory.events,
                                                    loadingState: false,
                                                  );
                                                }
                                                //  else if (index == 1) {
                                                //             return MyGradientsPage();
                                                //           } else if (index == 2) {
                                                //             return MyAboutPage();
                                                //           } else {
                                                //             return null;
                                                //           }
                                              },
                                            ),
                                          );
                                        },
                                        // ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      )),
          ],
        ),
      ),
//       floatingActionButton: FloatingActionButton(
//         heroTag: 'fab',
//         child: isThemeCurrentlyDark(context)
//             ? Icon(
//                 EvaIcons.sun,
//                 size: 30.0,
//               ) //show sun icon when in dark mode
//             : Icon(
//                 EvaIcons.moon,
//                 size: 26.0,
//               ), //show moon icon when in light mode
//         tooltip: isThemeCurrentlyDark(context)
//             ? 'Switch to light mode'
//             : 'Switch to dark mode',
//         foregroundColor: invertInvertColorsStrong(context),
//         backgroundColor: invertInvertColorsTheme(context),
//         elevation: 5.0,
//         onPressed: () {
//           DynamicTheme.of(context).setBrightness(
//               Theme.of(context).brightness == Brightness.dark
//                   ? Brightness.light
//                   : Brightness.dark);
//         },
//       ),
    );
  }
}
