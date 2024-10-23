import 'package:book/page/book_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BookClubApp());
}

class BookClubApp extends StatelessWidget {
  const BookClubApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookClubApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BookListPage(),
    );
  }
}
