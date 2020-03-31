import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class WebLoad extends StatefulWidget {
  final String url;
  WebLoad(this.url);
  @override
  _WebLoadState createState() => _WebLoadState();
}

class _WebLoadState extends State<WebLoad> {
  final key = UniqueKey();
  //  Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController _controller;
  //  Future<Null> _refresh() async{
  //   await Future.delayed(Duration(seconds:2));
  //   setState(() {
  //      getUser(widget.sheetId);
  //   });
  //   return null;
  // }
  String uRL;
  @override
  void initState() {
  uRL = ('https://' + widget.url);
  print(uRL);
  setState(() {
    
    if(_controller != null){
      _controller.loadUrl(uRL);
      if(_controller != null && _controller.currentUrl() != null && _controller.currentUrl() != uRL){
      _controller.loadUrl(uRL);
      // _controller.reload();
    }
    }
    
  });
    super.initState();
    
  }
  // @override
  // void dispose() {
  //   _controller.currentUrl().;
  //   super.dispose();
  // }
  checkLoad(){
    
  }

  @override
  Widget build(BuildContext context) {
    var verticalGestures = Factory<VerticalDragGestureRecognizer>(
  () => VerticalDragGestureRecognizer());
  var gestureSet = Set.from([verticalGestures]);
// _controller.
    // var c = _controller.loadUrl('https://' + widget.url);
  // _controller.currentUrl('https://' + widget.url);
    return Scaffold(
      
      body:  WebView(
        key: key,
          initialUrl: uRL ,
          javaScriptMode: JavaScriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            // _controller.complete(webViewController);
            //
            _controller = webViewController;
            // checkLoad();
            //  _controller.loadUrl('https://' + widget.url);
            gestureRecognizers: gestureSet;
          },
        ),
      
      // floatingActionButton: _bookmarkButton(),
    // return Scaffold(
    //   body: Container(
    //     child: WebviewScaffold(url: 'https://' + widget.url,
    //       withJavascript: true,
    //       withZoom: false,
    //       // hidden: true,
    //       initialChild: Container(
    //         color: Colors.transparent,
    //         child: Center(
    //           child: Row(
    //             children: <Widget>[
    //               Text('Loading'),
    //               SpinKitFadingFour(
    //                 color: Colors.black
    //               )
    //             ],
    //           ),)
    //       ),
    //     ),
    //   ),
    );
    
  }
}
class WebLoadEnt extends StatefulWidget {
  final String url;
  WebLoadEnt(this.url);
  @override
  _WebLoadEntState createState() => _WebLoadEntState();
}

class _WebLoadEntState extends State<WebLoadEnt> {
  final key = UniqueKey();
  //  Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController _controller;
  //  Future<Null> _refresh() async{
  //   await Future.delayed(Duration(seconds:2));
  //   setState(() {
  //      getUser(widget.sheetId);
  //   });
  //   return null;
  // }
  String uRL;
  @override
  void initState() {
  uRL = 'https://techkriti.org/e-conclave' ;
  // print(uRL);
  setState(() {
    
    if(_controller != null){
      _controller.loadUrl(uRL);
      if(_controller != null && _controller.currentUrl() != null && _controller.currentUrl() != uRL){
      _controller.loadUrl(uRL);
      // _controller.reload();
    }
    }
    
  });
    super.initState();
    
  }
  // @override
  // void dispose() {
  //   _controller.currentUrl().;
  //   super.dispose();
  // }
  checkLoad(){
    
  }

  @override
  Widget build(BuildContext context) {
    var verticalGestures = Factory<VerticalDragGestureRecognizer>(
  () => VerticalDragGestureRecognizer());
  var gestureSet = Set.from([verticalGestures]);
// _controller.n
    // var c = _controller.loadUrl('https://' + widget.url);
  // _controller.currentUrl('https://' + widget.url);
    return Scaffold(
      
      body:  WebView(
        key: key,
          
          javaScriptMode: JavaScriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            // _controller.complete(webViewController);
            //
            _controller = webViewController;
            // checkLoad();
            //  _controller.loadUrl('https://' + widget.url);
            gestureRecognizers: gestureSet;
          },
          initialUrl: 'https://techkriti.org/e-conclave' ,
        ),
      
      // floatingActionButton: _bookmarkButton(),
    // return Scaffold(
    //   body: Container(
    //     child: WebviewScaffold(url: 'https://' + widget.url,
    //       withJavascript: true,
    //       withZoom: false,
    //       // hidden: true,
    //       initialChild: Container(
    //         color: Colors.transparent,
    //         child: Center(
    //           child: Row(
    //             children: <Widget>[
    //               Text('Loading'),
    //               SpinKitFadingFour(
    //                 color: Colors.black
    //               )
    //             ],
    //           ),)
    //       ),
    //     ),
    //   ),
    );
    
  }
}
class WebLoadTech extends StatefulWidget {
  final String url;
  WebLoadTech(this.url);
  @override
  _WebLoadTechState createState() => _WebLoadTechState();
}

class _WebLoadTechState extends State<WebLoadTech> {
  final key = UniqueKey();
  //  Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController _controller;
  //  Future<Null> _refresh() async{
  //   await Future.delayed(Duration(seconds:2));
  //   setState(() {
  //      getUser(widget.sheetId);
  //   });
  //   return null;
  // }
  String uRL;
  @override
  void initState() {
  uRL = 'https://technocruise.techkriti.org' ;
  // print(uRL);
  setState(() {
    
    if(_controller != null){
      _controller.loadUrl('https://technocruise.techkriti.org');
      if(_controller != null && _controller.currentUrl() != null && _controller.currentUrl() != uRL){
      _controller.loadUrl('https://technocruise.techkriti.org');
      // _controller.reload();
    }
    }
    
  });
    super.initState();
    
  }
  // @override
  // void dispose() {
  //   _controller.currentUrl().;
  //   super.dispose();
  // }
  checkLoad(){
    
  }

  @override
  Widget build(BuildContext context) {
    var verticalGestures = Factory<VerticalDragGestureRecognizer>(
  () => VerticalDragGestureRecognizer());
  var gestureSet = Set.from([verticalGestures]);
// _controller.n
    // var c = _controller.loadUrl('https://' + widget.url);
  // _controller.currentUrl('https://' + widget.url);
    return Scaffold(
      
      body:  WebView(
        key: key,
          
          javaScriptMode: JavaScriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            // _controller.complete(webViewController);
            //
            _controller = webViewController;
            // checkLoad();
            //  _controller.loadUrl('https://' + widget.url);
            gestureRecognizers: gestureSet;
          },
          initialUrl: 'https://technocruise.techkriti.org' ,
        ),
      
      // floatingActionButton: _bookmarkButton(),
    // return Scaffold(
    //   body: Container(
    //     child: WebviewScaffold(url: 'https://' + widget.url,
    //       withJavascript: true,
    //       withZoom: false,
    //       // hidden: true,
    //       initialChild: Container(
    //         color: Colors.transparent,
    //         child: Center(
    //           child: Row(
    //             children: <Widget>[
    //               Text('Loading'),
    //               SpinKitFadingFour(
    //                 color: Colors.black
    //               )
    //             ],
    //           ),)
    //       ),
    //     ),
    //   ),
    );
    
  }
}
