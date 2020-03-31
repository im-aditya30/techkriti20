import 'package:flutter/material.dart';

class Category {
  final String name;
  List<Category> subCategories;
  List<Event> events;
  String image;

  Category({
    @required this.name,
    this.subCategories,
    this.events,
    this.image,
  }) {
    if (image == null) {
      image = "blank_image";
    }
  }
}

class Event {
  final String name;
  final int teamSize;
  final int prize;
  final List<Content> content;

  Event({
    @required this.name,
    this.teamSize,
    this.prize,
    this.content,
  });
}

class Content {
  final String htmlContent;
  final String title;

  Content({
    this.htmlContent,
    this.title,
  });
}
// class NavBarItem{
//   final String icon;
//   NavBarItem({this.icon});
// }