
import 'package:flutter/material.dart';
import 'package:techkriti20/pages/enquiry/enquiry.dart';

// class Enquiry extends StatelessWidget {
//  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xFF2e282a),
//       alignment: Alignment.topCenter,
//       child: SimpleFoldingCell(
//           key: _foldingCellKey,
//           frontWidget: _buildFrontWidget(),
//           innerTopWidget: _buildInnerTopWidget(),
//           innerBottomWidget: _buildInnerBottomWidget(),
//           cellSize: Size(MediaQuery.of(context).size.width, 125),
//           padding: EdgeInsets.all(15),
//           animationDuration: Duration(milliseconds: 300),
//           borderRadius: 10,
//           onOpen: () => print('cell opened'),
//           onClose: () => print('cell closed')),
//     );
//   }

//   Widget _buildFrontWidget() {
//     return Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Color(0xFFffcd3c),
//         // color: Colors.white,
//         alignment: Alignment.bottomCenter,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           // crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             Center(
//               child: Text("CARD",
//                   style: TextStyle(
//                       color: Color(0xFF2e282a),
//                       fontFamily: 'OpenSans',
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w800)),
//             ),
//             // FlatButton(
//             //   onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
//             //   child: Text(
//             //     "Open",
//             //   ),
//             //   textColor: Colors.white,
//             //   color: Colors.indigoAccent,
//             //   splashColor: Colors.white.withOpacity(0.5),
//             // )
//             Align(
//             alignment: Alignment.bottomCenter,
//             // widthFactor: 2,
//               child: IconButton(icon: Icon(Icons.keyboard_arrow_down,size:30.0), onPressed: ()=> _foldingCellKey?.currentState?.toggleFold()))
//           ],
//         ));
//   }

//   Widget _buildInnerTopWidget() {
//     return Container(
//         color: Color(0xFFff9234),
//         alignment: Alignment.center,
//         child: Text("TITLE",
//             style: TextStyle(
//                 color: Color(0xFF2e282a),
//                 fontFamily: 'OpenSans',
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.w800)));
//   }

//   Widget _buildInnerBottomWidget() {
//     return Container(
//       color: Color(0xFFecf2f9),
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: EdgeInsets.only(bottom: 10),
//         // child: FlatButton(
//         //   onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
//         //   child: Text(
//         //     "Close",
//         //   ),
//         //   textColor: Colors.white,
//         //   color: Colors.indigoAccent,
//         //   splashColor: Colors.white.withOpacity(0.5),
//         // ),
//         child: IconButton(icon: Icon(Icons.close,color: Colors.black,), onPressed:()=> _foldingCellKey?.currentState?.toggleFold(),)
//       ),
//     );
//   }
// }



// class Enquiry extends StatefulWidget {
//   @override
//   _EnquiryState createState() => _EnquiryState();
// }

// class _EnquiryState extends State<Enquiry> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: new Container(
//         color: new Color(0xFF736AB7),
//         child: new CustomScrollView(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: false,
//           slivers: <Widget>[
//             new SliverPadding(
//               padding: const EdgeInsets.symmetric(vertical: 24.0),
//               sliver: new SliverList(
//                 delegate: new SliverChildBuilderDelegate(
//                     (context, index) => new PlanetRow(planets[index]),
//                   childCount: planets.length,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class Enquiry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width:double.infinity,
        height: double.infinity,
        child: EnquiryHome()),
    );
  }
}