// import 'package:flutter/material.dart';
// import 'package:techkriti20/data/sponsors.dart';
// class Sponsors extends StatefulWidget {
//   @override
//   _SponsorsState createState() => _SponsorsState();
// }

// class _SponsorsState extends State<Sponsors> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Expanded(child: GridView.count(crossAxisCount: 1,
//         childAspectRatio: 3.0,
//         children: List.generate(
//           sponsors.length, (index){
//             var sponsor = sponsors[index];
//             var company = sponsor['companies'][index];
//             return Stack(
//               children:<Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(image: AssetImage())
//                   )
//                 )
//               ]
//             );
//           }),
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:techkriti20/data/sponsors.dart';

// import 'package:techkriti20/Common/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:techkriti20/data/sponsors.dart';


dynamic _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
String replaceAll(String name){
  return name.replaceAll(' ', '_');
}

class Sponsors extends StatelessWidget {

  Widget _listBuilder(BuildContext context, int index) {
    var size = MediaQuery.of(context).size;
    var category = sponsors[index];
    var content = <Widget>[];

    content.add(
      Container(
        // margin: EdgeInsets.only(top: 48.0, left: 8.0, right: 8.0, bottom: 32.0),
        alignment: Alignment.center,
        child: Text(
          category['title'].toString().toUpperCase(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subhead.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            // decoration: TextDecoration.underline,
          ),
        ),
      )
    );

    content.add(
      Container(
        margin: EdgeInsets.only(bottom: 16, top: 8),
        height: 2,
        width: 144,
        color: Colors.blueAccent,
      )
    );

    var gridItems = <Widget>[];
    for (var company in category['companies']) {
      gridItems.add(
        GestureDetector(
          onTap: () {
            _launchURL(company['url']);
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
            ),
            // width:200.0,
            // alignment: Alignment.center,
            child: Image.asset(
              replaceAll(company['image']),
            ),
          ),
        )
      );
    }

    content.add(
      GridView.count(
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 1,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: gridItems,
      )
    );
    
    return Card(
      margin: EdgeInsets.all(36),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(24),
        width: size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: content,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   titleString: 'Sponsors',
      // ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: sponsors.length,
        itemBuilder: _listBuilder,
      ),
    );
  }
}