import 'package:flutter/material.dart';
// import 'package:techkriti20/pages/enquiry/model/enquiry.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:techkriti20/utils/text_styles.dart';
import 'package:techkriti20/utils/ui_helpers.dart';

// GetIt locator = GetIt();

// void setupLocator(){
//   locator.registerSingleton(Calls());
// }


class EnquiryHospiRow extends StatelessWidget {

  final hospi;

  EnquiryHospiRow(this.hospi);

  @override
  Widget build(BuildContext context) {
    final hospiThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 16.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(92),
              child: new Image(
          image: new AssetImage(hospi['imageURL']),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );
    
    final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
    );
    final regularTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 9.0,
      fontWeight: FontWeight.w400
    );
    final subHeaderTextStyle = regularTextStyle.copyWith(
      fontSize: 12.0
    );
    final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
    );

    Widget _hospiValue({dynamic value, String image,String number}) {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // new Image.asset(image, height: 12.0),
          CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.blue,
                      child: new IconButton(
              icon: SvgPicture.asset(
                'assets/icons/facebookLogo.svg',
                color: Colors.white,
                height: 20.0,
                width: 20,
              ),
              onPressed: () {
                launchURL(value);
              },
            ),
          ),
          new Container(width: 20.0),
          CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.blue,
            child: 
          IconButton(icon: Icon(Icons.call),
          color: Colors.white,
            onPressed: (){
              launchCaller(number);
            },
          )
          )
          // new Text( 'Contactus', style: regularTextStyle),
        ]
      );
    }
    // final iconAtBottom = Container(
    //   margin: EdgeInsets.fromLTRB(100, 90, 60, 0),
    //   alignment: FractionalOffset.bottomCenter,
    //   // child: Row(
    //   //   children: <Widget> [
    //   //     new Container(
    //   //           child: _hospiValue(
    //   //             value: hospi.facebookUrl,
    //   //             // image: 'assets/img/ic_distance.png')
    //   //           )
    //   //         ),
              
    //   //   ]
    //   // )
    //   child:new Container(
    //             child: _hospiValue(
    //               value: hospi.facebookUrl,
    //               number: hospi.contact
    //               // image: 'assets/img/ic_gravity.png')
    //             )
    //           )
    // );


    final hospiCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 10.0, 16.0, 10.0),
      constraints: new BoxConstraints.expand(),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: ,
        children: <Widget>[
          // SizedBox(width: 10),
          Container(
            width:120,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  
                  new Container(height: 4.0),
                  new Text(hospi['name'], style:TextStyle(
                    color: Colors.white,
                    fontSize: 15.0
                                  
                  )),
              new Container(height: 5.0),
              new Text(hospi['designation'], style: subHeaderTextStyle),
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 10.0),
                height: 2.0,
                width: 50.0,
                color: new Color(0xff00c6ff)
              ),
                ],
              ),
            ),
          ),
          // SizedBox(width: 40),
         
              new Expanded(
                child: _hospiValue(
                  number: hospi['phone'],
                  value: hospi['social']['facebook'],
                  // image: 'assets/img/ic_gravity.png')
                )
              )
            

        ],
      ),
    );


    final hospiCard = new Container(
      child: hospiCardContent,
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );


    return new Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: new Stack(
        children: <Widget>[
          hospiCard,
          hospiThumbnail,
          // iconAtBottom,
        ],
      )
    );
  }
}