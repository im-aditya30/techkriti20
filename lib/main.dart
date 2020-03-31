import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:techkriti20/flashScreen.dart';
import 'package:techkriti20/pages/event_list/catalog/catalogclick.dart';
// import 'package:techkriti20/pages/home.dart';
import 'package:techkriti20/shared/drawer.dart';

void main() {
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        fontFamily: 'Quicksand',
        // primaryColor: MyColors.primary,
        // accentColor: MyColors.accent,
        brightness: brightness, // default is dark
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Techkriti20',
          theme: theme,
          home: SplashScreen(),
          routes: <String, WidgetBuilder> {
            '/HomeScreen': (BuildContext context) => CustomDrawer(),
            '/catalogClick': (BuildContext context) => new CatalogClick(),
            // '/catalog' : (BuildContext context) => new Catalog(title: 'Competitions',),
    // '/screen2' : (BuildContext context) => new Screen2(),
    // '/screen3' : (BuildContext context) => new Screen3(),
    // '/screen4' : (BuildContext context) => new Screen4()
  },
        );
      },
    );
  }
}
