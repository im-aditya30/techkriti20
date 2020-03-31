import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:techkriti20/data/model/data_models.dart';
import 'package:techkriti20/shared/html.dart';
import 'package:techkriti20/utils/colors.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:techkriti20/utils/ui_helpers.dart';

class ContentTab extends StatefulWidget {
  final Event event;
  final List<Event> eventList;
  ContentTab({Key key, this.title,this.event,this.eventList}) : super(key: key);

  final String title;
  @override
  _ContentTabState createState() => _ContentTabState();
}

class _ContentTabState extends State<ContentTab>  with SingleTickerProviderStateMixin {
  List<Tab> tabs = List();
  TabController controller;
  int prize;
  int teamSize;

  @override
  void initState() {
    super.initState();
    var length = (widget.event == null) ? null : widget.event.content.length;
  print('lenght: '  + length.toString());
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
    for(var i=0;i< widget.event.content.length;i++){ 
         tabs.add(
                  Tab(child: Text(
             widget.event.content[i].title,
             style: TextStyle(fontSize: 15),
           ),),
         ) ;
    }
    return TabBar(
      isScrollable: true,
      // indicatorSize: TabBarIndicatorSize.values,
      labelColor: MyColors.black,
      // tabs: <Tab>[
        tabs: tabs,
        // Tab(
        //   // set icon to the tab
        //   icon: Icon(Icons.favorite),
        // ),
        // Tab(
        //   icon: Icon(Icons.adb),
        // ),
        // Tab(
        //   icon: Icon(Icons.airport_shuttle),
        // ),
      // ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // physics: ScrollPhysics,
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  /*
   *-------------------- Setup the page by setting up tabs in the body ------------------*
   */
  @override
  Widget build(BuildContext context) {
    prize = widget.event.prize;
    teamSize = widget.event.teamSize;
    var hasTabs = (widget.event != null) ? widget.event.content.length >1 :false;
    var eventcontent = (widget.event == null && widget.eventList != null) ? null : widget.event.content ;
  print('hasTabs:' + hasTabs.toString());
    List<Widget> _tabdetails = List();
    for(var i=0 ; i< eventcontent.length; i++){
      _tabdetails.add(
              SingleChildScrollView(
          child: CustomHtml(data: eventcontent[i].htmlContent)
        ),
      );
    }
    return Scaffold(
      // Appbar
        // appBar: AppBar(
        //   // Title
        //     title: Text("Using Tabs"),
        //     // Set the background color of the App Bar
        //     backgroundColor: Colors.blue,
        //     // Set the bottom property of the Appbar to include a Tab Bar
        //     bottom: getTabBar()),
        // // Set the TabBar view as the body of the Scaffold
      backgroundColor: invertInvertColorsStrong(context),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Container(
               decoration: BoxDecoration(
                 boxShadow: kElevationToShadow[1],
                 color: Colors.white
               ),
                   padding: EdgeInsets.only(top:40.0,bottom:10.0,left:10.0),
                   
                    child:Row(
              children: <Widget>[
                  IconButton(icon: Icon(EvaIcons.arrowIosBack), onPressed: ()=> Navigator.of(context).pop()),
                  Container(
                    width: MediaQuery.of(context).size.width - 80.0,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                                          child: Text(
                        widget.title,
                              style: isThemeCurrentlyDark(context)
                            ? TitleStylesDefault.white
                            : TitleStylesDefault.black,
                              
                              maxLines: 1,
                              // overflow: TextOverflow.ellipsis,
                              //  style: 
                          ),
                    ),
                  ),
                  
              ],
            ),
            ),
            Expanded(child: hasTabs ? 
              Stack(
                // fit: StackFit.expand,
                // mainAxisAlignment: MainAxisAlignment.start,
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
                    :
                    Container(
                      alignment: Alignment.topCenter,
                      child: ListView(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topCenter,
                      child: CustomHtml(
            data: eventcontent[0].htmlContent,
          
            ),
                  ),
                ],
              ),
                    ),
            )
                ]
              )
        )
    );
        
  }
  createTabPages(eventcontent){
    
  }
}


