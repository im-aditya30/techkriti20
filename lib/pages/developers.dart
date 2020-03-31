import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:techkriti20/utils/ui_helpers.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class Developers extends StatefulWidget {
  @override
  _DevelopersState createState() => _DevelopersState();
}

class DevelopersContent{
  final String imageURL;
  final String name;
  final String designation;
  final String facebookURL;
  final String linkedin;
  final String github;
  final String mailid;
  DevelopersContent(this.imageURL,this.name,this.designation,this.facebookURL,this.github,this.linkedin,this.mailid);
}
List<DevelopersContent> developerContent= [
  DevelopersContent('assets/images/team/Nimish.png', 'Nimish Aggarwal', 'Headed by','https://www.facebook.com/nimish.52','','https://www.linkedin.com/in/agnimish/','nimishag@techkriti.org'),
  DevelopersContent('assets/images/team/Aditya.png', 'Aditya Gupta', 'Developed By','https://www.facebook.com/solisaditya','https://github.com/im-aditya30'
    ,'','adtgupta@iitk.ac.in'
  ),
  
];
class _DevelopersState extends State<Developers> {
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      // body: Container(
      //   alignment: Alignment.center,
      //   padding: EdgeInsets.symmetric(horizontal: 20),
      //   child:ListView.builder(
      //       itemCount: developerContent.length, 
      //       itemBuilder: (BuildContext context,int index){
      //         return Column(
      //           children: <Widget>[
      //              index == 1? SizedBox() : SizedBox(height: 20,),
      //             Stack(
      //               // fit: StackFit.expand,
      //               alignment: Alignment.bottomCenter,
      //               children:<Widget> [
      //                 Image.asset(developerContent[index].image,fit: BoxFit.fitHeight,height:media.height*0.8,width: media.width - 40),
      //                 Positioned(
      //                   bottom: 20,
      //                   left: 0.0,
      //                   // alignment: Alignment.bottomLeft,
      //                   child: Text(developerContent[index].name,style: ImageTextMontserrat.white,)),
                      
      //               ]
      //             ),
      //               SizedBox(height: 20,)
      //           ],
      //         );
      //       } 
      //   )
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: DeveloperImage()),
    );
  }
}
class DeveloperImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TransformerPageView(
        // loop: true,
        viewportFraction: 0.8,
        transformer: new PageTransformerBuilder(
            builder: (Widget child, TransformInfo info) {
          var member = developerContent;

          return new Padding(
            padding: new EdgeInsets.fromLTRB(20.0, 20, 20, 20),
            child: new Material(
              elevation: 6.0,
              color: Colors.transparent,
              textStyle: new TextStyle(color: Colors.white),
              // borderRadius: new BorderRadius.circular(100.0),
              child: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: new ParallaxImage.asset(
                      member[info.index].imageURL,
                      position: info.position,
                    ),
                  ),
                  new Positioned(
                    child: Container(
                      padding: EdgeInsets.only(top:10),
                      color: Colors.black.withOpacity(0.6),
                      child: new Column(
                        // mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new ParallaxContainer(
                            child: 
                            Text(member[info.index].designation,
                                style: new TextStyle(fontSize: 25.0)),
                            position: info.position,
                            translationFactor: 300.0,
                          ),
                          new SizedBox(
                            height: 8.0,
                          ),
                          new ParallaxContainer(
                            child: new Text(
                              member[info.index].name,
                              style: ImageTextMontserrat.white,
                            ),
                            position: info.position,
                            translationFactor: 200.0,
                          ),
                          SizedBox(
                      height: 30.0,
                  ),
                  Container(
                      // width: MediaQuery.of(context).size.width*0.6,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
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
                                  launchURL(member[info.index].facebookURL);
                                },
                              ),
                            ),
                            Container(width: 20),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.blue,
                              child: new IconButton(
                                // icon: SvgPicture.asset(
                                //   'assets/icons/facebookLogo.svg',
                                //   color: Colors.white,
                                //   height: 20.0,
                                //   width: 20,
                                // ),
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  launchMail(member[info.index].mailid);
                                },
                              ),
                            ),
                            Container(width: 20),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.blue,
                              child: new IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/linkedin.svg',
                                  color: Colors.white,
                                  height: 20.0,
                                  width: 20,
                                ),
                                onPressed: () {
                                  launchURL(member[info.index].linkedin);
                                },
                              ),
                            ),
                            Container(width: 20),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.blue,
                              child: new IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/githubLogo.svg',
                                  color: Colors.white,
                                  height: 20.0,
                                  width: 20,
                                ),
                                
                                onPressed: () {
                                  launchURL(member[info.index].github);
                                },
                              ),
                            ),
                          ]),
                  )
                        ],
                      ),
                    ),
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  
                ],
              ),
            ),
          );
        }),
        itemCount: 2);
  }}
