import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/menu/item_hidden_menu.dart';
import 'package:hidden_drawer_menu/hidden_drawer/screen_hidden_drawer.dart';
import 'package:techkriti20/pages/developers.dart';
// import 'package:techkriti20/data/model/data_models.dart';
import 'package:techkriti20/pages/event_list/catalog/catalog.dart';
import 'package:techkriti20/pages/event_list/event_list.dart';
import 'package:techkriti20/pages/home.dart';
import 'package:techkriti20/pages/schedule/schedule.dart';
import 'package:techkriti20/pages/screens/enquiry.dart';
import 'package:techkriti20/pages/screens/events.dart';
import 'package:techkriti20/pages/screens/hospitality.dart';
import 'package:techkriti20/pages/screens/summit.dart';
import 'package:techkriti20/pages/security.dart';
import 'package:techkriti20/pages/sponsors/sponsors.dart';
import 'package:techkriti20/pages/team/team.dart';
import 'package:techkriti20/shared/coming_soon.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:techkriti20/widgets/sexy_bottom_sheet.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key key}) : super(key: key);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}
class DrawerContent{
  final String title;
  final Widget widget;
  DrawerContent(this.title,this.widget);
}
class _CustomDrawerState extends State<CustomDrawer> {
  List<String> title = [
    'Home','Events','Team','Schedule','Hospitality','Enquiry','Developers','Summit'
  ];
  

  List<DrawerContent> drawerContent = [
    DrawerContent('Home', Home()),
    DrawerContent('Events', Event()),
    DrawerContent('Team', Team()),
    DrawerContent('Schedule', Schedule()),
    DrawerContent('Entrepreneurial\nConclave', WebLoadEnt('Entrepreneurial Conclave')),
    DrawerContent('Hospitality', EventList(head: 'Hospitality',loadingState: false,eventList: null,)),
    DrawerContent('Enquiry', Enquiry()),
    DrawerContent('Developers', Developers()),
    DrawerContent('Sponsors', Sponsors()),
    DrawerContent('Security', SecurityPage()),
    DrawerContent('Tech Summit', WebLoad('techkriti.org/tech-summit')),
    DrawerContent('Technocruise', WebLoadTech('technocruise.techkriti.org')),
    
  ];
   List<ScreenHiddenDrawer> itens = new List();
    bool darkmode =true;
  @override
  void initState() {
    for(var value in drawerContent){
      itens.add(ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: value.title,
          selected: true,
          selectedStyle: TextStyle(color: Colors.yellow[900],fontSize: 25.0),
          baseStyle: TextStyle( color: Colors.white, fontSize: 20.0 ),
          colorLineSelected: Colors.amber[900],
        ),
        value.widget
      ));
    }


    // itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: title[0],
    //       selected: true,
    //       selectedStyle: TextStyle(color: Colors.teal[900],fontSize: 30.0),
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 26.0 ),
    //       colorLineSelected: Colors.teal[900],
    //     ),
    //     Home(

    //     ))); 
    // itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: title[1],
    //       selected: true,
    //       selectedStyle: TextStyle(color: Colors.amber,fontSize: 30.0),
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 26.0 ),
    //       colorLineSelected: Colors.amber,
    //     ),
    //     Event()));

    // itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: title[2],
    //       selected: true,
    //       selectedStyle: TextStyle(color: Colors.orange,fontSize: 30.0),
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 26.0 ),
    //       colorLineSelected: Colors.orange,
    //     ),
    //     Team()));
    //     itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: 'Technocruise',
    //       selected: true,
    //       selectedStyle: TextStyle(color: Colors.orange,fontSize: 30.0),
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 26.0 ),
    //       colorLineSelected: Colors.orange,
    //     ),
    //     ComingSoon()));
    // itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: title[3],
    //       selected: true,
    //       selectedStyle: TextStyle(color: Colors.orange,fontSize: 30.0),
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 26.0 ),
    //       colorLineSelected: Colors.orange,
    //     ),
    //     Schedule()));
    //   itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: title[4],
    //       selected: true,
    //       selectedStyle: TextStyle(color: Colors.orange,fontSize: 30.0),
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 26.0 ),
    //       colorLineSelected: Colors.orange,
    //     ),
    //     EventList(head: 'Hospitality',loadingState: false,eventList: null,)));
    //     itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: title[5],
    //       selected: true,
    //       selectedStyle: TextStyle(color: Colors.orange,fontSize: 30.0),
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 26.0 ),
    //       colorLineSelected: Colors.orange,
    //     ),
    //     Enquiry()));
    //     itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: title[6],
    //       selected: true,
    //       selectedStyle: TextStyle(color: Colors.orange,fontSize: 30.0),
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 26.0 ),
    //       colorLineSelected: Colors.orange,
    //     ),
    //     Container()));
    //     itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: title[7],
    //       selected: true,
    //       selectedStyle: TextStyle(color: Colors.orange,fontSize: 30.0),
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 26.0 ),
    //       colorLineSelected: Colors.orange,
    //     ),
    //     Summit()));
    // itens.add(new ScreenHiddenDrawer(
    //     new ItemHiddenMenu(
    //       name: "DarkMode",
    //       baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
    //       colorLineSelected: Colors.orange,
    //     ),
    //     Switch(value: darkmode, onChanged: (bool newValue){
    //       setState(() {
    //         darkmode = newValue;
    //         DynamicTheme.of(context).setBrightness(
    //           Theme.of(context).brightness == Brightness.dark
    //               ? Brightness.light
    //               : Brightness.dark);
    //       });
    //     })));

    super.initState();
  }
 @override
  Widget build(BuildContext context) {

    return HiddenDrawerMenu(
      paddingTop: MediaQuery.of(context).size.height * 0.3,
      paddingBottom: MediaQuery.of(context).size.height * 0.0,
      // height: 250.0,
      initPositionSelected: 0,
      styleAutoTittleName: TitleStylesDefault.white,
          // screens: itens,
          elevationAppBar: 0.0,
      backgroundColorMenu: Colors.blueGrey,
      backgroundColorAppBar: Colors.black,
      screens: itens,
      actionsAppBar: <Widget>[
        IconButton(icon: Icon(Icons.account_circle,color:Colors.white), onPressed: null),
        IconButton(icon: Icon(Icons.notifications,color:Colors.white), onPressed: null)
      ],
          //  typeOpen: TypeOpen.FROM_RIGHT,
          //  enableScaleAnimin: true,
          //  enableCornerAnimin: true,
          //  slidePercent: 80.0,
          //  verticalScalePercent: 80.0,
          //  contentCornerRadius: 10.0,
          //  iconMenuAppBar: Icon(Icons.menu),
          //  backgroundContent: DecorationImage((image: ExactAssetImage('assets/background/background.png'),fit: BoxFit.cover),
          //  whithAutoTittleName: true,
          //  styleAutoTittleName: TextStyle(color: Colors.red),
          //  actionsAppBar: <Widget>[],
          //  backgroundColorContent: Colors.blue,
          //  elevationAppBar: 4.0,
          //  tittleAppBar: Center(child: Icon(Icons.ac_unit),),
           enableShadowItensMenu: true,
           backgroundMenu: DecorationImage(image: AssetImage('assets/background/background.png'),fit: BoxFit.fill),
    );
    
  }
}