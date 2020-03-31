import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techkriti20/data/data.dart';
// import 'package:techkriti20/data/model/data_models.dart';
import 'package:techkriti20/pages/event/layout_item.dart';
import 'package:techkriti20/pages/event/page_transformer.dart';
// import 'package:techkriti20/pages/event_list/catalog/catalog.dart';
// import 'package:techkriti20/pages/event_list/event_list.dart';

class Layout extends StatelessWidget {
  //  Event event;
  // Category category;
  // String image;

  // Layout.event(this.event,this.image) {
  //   category = null;
  // }

  // Layout.category(this.category,this.image) {
  //   event = null;
  // }
  Layout.superCategory();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/background/background.png'),fit: BoxFit.fill)),
        child: Center(
          child: SizedBox.fromSize(
            size: const Size.fromHeight(500.0),
            child: PageTransformer(
              pageViewBuilder: (context, visibilityResolver) {
                return PageView.builder(
                  controller: PageController(viewportFraction: 0.85),
                  itemCount: eventsName.length,
                  itemBuilder: (context, index) {
                    // var i = index;
                    final category = eventsName[index];
                    final pageVisibility =
                        visibilityResolver.resolvePageVisibility(index);

                    return LayoutItem(
                      category: category,
                      pageVisibility: pageVisibility,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
