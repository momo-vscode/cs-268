// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math' as math;

import 'package:flutter_lorem/flutter_lorem.dart';

// Class Book and it's static method
class Book {
  final String title;
  final String author;
  final String imageUrl;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
  });

  //Book-static method
  static Book createMockBook() {
    return Book(
        title: Mock.title(),
        author: Mock.author(),
        imageUrl: Mock.imageUrl(),
        description: Mock.description());
  }
}

//class Mock
final List<String> colors = [
  "green",
  "red",
  "orange",
  "yellow",
  "blue",
  "pink",
  "cyan",
  "magenta",
  "coral",
  "brown"
];

class Mock {
  static String title() {
    return lorem(paragraphs: 1, words: 1).replaceAll(".", "");
  }

  static String author() {
    String firstName = lorem(paragraphs: 1, words: 1).replaceAll(".", "");
    String lastName = lorem(paragraphs: 1, words: 1).replaceAll(".", "");
    return "${firstName} ${lastName}";
  }

  static String imageUrl() {
    String background = colors[math.Random().nextInt(10)];
    return 'https://placehold.co/260x320/${background}/${background}.png';
  }

  static String description() {
    return lorem(paragraphs: 5);
  }
}
