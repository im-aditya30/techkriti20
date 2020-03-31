import 'package:flutter/material.dart';

// import 'package:techkriti/Common/app_bar.dart';
import 'package:techkriti20/data/data.dart';
import 'package:techkriti20/utils/text_styles.dart';

class SecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: CustomAppBar(
      //   titleString: 'Security Guidelines',
      //   actionsList: <Widget>[],
      // ),
      body: Container(
        padding: EdgeInsets.all(48),
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Text(
                        '${i + 1}',
                        style: Theme.of(context).textTheme.body1.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1.05,
                          height: 1.25,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        securityGuidelines[i],
                        // style: Theme.of(context).textTheme.body1.copyWith(
                        //   fontSize: 16,
                        //   letterSpacing: 1.05,
                        //   height: 1.25,
                        //   color: Colors.white,
                        // ),
                        style: BodyStyleMuli.white,
                      )
                    ),
                  ],
                ),
              );
            },
            itemCount: securityGuidelines.length,
          ),
        ),
      ),
    );
  }
}