import 'package:flutter/material.dart';

import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;
import 'package:flutter_html/flutter_html.dart';
import 'package:techkriti20/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

Widget _customRender(dom.Node node, List<Widget> children) {
  if (node is dom.Element) {
    switch (node.localName) {
      case 'ol':
        return HtmlList(items: node.children, type:ListType.ORDERED);
        break;
      case 'ul':
        return HtmlList(items: node.children, type: ListType.UNORDERED);
        break;
      case 'h4':
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              node.text,
              style: BodyStylesDefault.black
            ),
          ),
        );
        break;
      case 'g':
        return Text(
          node.text
        );
        break;
    }
  }
}

dynamic _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class CustomHtml extends StatelessWidget {
  final String data;

  const CustomHtml({
    @required this.data,
  });

  String _sanitize(String data) {
    var s = data.replaceAll('\n', '');
    s = s.replaceAll('\t', '');
    var html = parse(s);

    var metas = html.getElementsByTagName('meta');
    if (metas.isNotEmpty) {
      for (var m in metas) {
        m.remove();
      }
    }
    
    var pList = html.getElementsByTagName('p');
    if (pList.isNotEmpty) {
      for (var p in pList) {
        if (p.text == '') {
          p.remove();
        }
      }
    }

    var h4 = html.getElementsByTagName('h4');
    if (h4.isNotEmpty) {
      for (var h in h4) {
        if (h.text == '') {
          h.parent.children.addAll(h.children);
          h.remove();
        }
      }
    }

    // var spans = html.getElementsByTagName('span');
    // if (spans.isNotEmpty) {
    //   for (var s in spans) {
    //     if (s.parent != null) {
    //       dom.Node parent = s.parent;
    //       s.reparentChildren(parent);
    //       s.remove();
    //     }
    //   }
    // }

    s = html.body.innerHtml;
    print('$s \n\n\n');
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(
        renderNewlines: false,
        data: _sanitize(data),
        padding: EdgeInsets.only(right: 15,bottom: 12.0,top: 12 ,left:24),
        // defaultTextStyle: Theme.of(context).textTheme.body1.copyWith(
        //   // color: Colors.black87,
        //   color: Colors.black,
        //   fontSize: 18,
        //   height: 1.5,
        //   // letterSpacing: 0.6,
        // ),
        // defaultTextStyle: BodyStylesDefault.black
        defaultTextStyle: TextStyle(color: Colors.black,
        height: 1.3,
        fontSize: 18,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w200
        ),
        customRender: _customRender,
        onLinkTap: (u) {
          _launchURL(u);
        },
      ),
    );
  }
}


class HtmlList extends StatelessWidget {
  final List<dom.Element> items;
  final ListType type;

  const HtmlList({
    @required this.items,
    @required this.type,
  });

  @override
  Widget build(BuildContext context) {
    var itemWidgets = items.map((e) {

      // TODO: Decide a bullet
      var index;
      if (type == ListType.ORDERED) {
        index = '${items.indexOf(e) + 1}';
      } else {
        index = 'o';
      }

      return Container(
        padding: EdgeInsets.all(8),
        child: HtmlListItem(item: e, index: index),
      );
    }).toList();

    return Container(
      child: Column(
        children: itemWidgets,
      ),
    );
  }
}


class HtmlListItem extends StatelessWidget {
  final dom.Element item;
  final String index;

  const HtmlListItem({
    @required this.item,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    
    var pList = item.getElementsByTagName('p');
    if (pList.isNotEmpty){
      for (var p in pList) {
        item.text = '${p.text}\n';
        p.remove();
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text('o '),
        Container(
          margin: EdgeInsets.only(right: 8,),
          child: Text(
            index,
            style: Theme.of(context).textTheme.body1.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15.0
            ),
          )
        ),
        Expanded(
          child: Container(
            child: Html(
              data: item.innerHtml,
              onLinkTap: (u) {
                _launchURL(u);
              },
              customRender: _customRender,
            ),
          ),
        )
      ],
    );
  }
}


enum ListType { UNORDERED, ORDERED }