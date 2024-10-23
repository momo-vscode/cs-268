import 'package:book/mook_book.dart';
import 'package:book/widget/book_card.dart';
import 'package:flutter/material.dart';

class BookDetailWidget extends StatelessWidget {
  final Book book;
  const BookDetailWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BookCard(book: book, height: 300.0, width: 210.0),
                const SizedBox(height: 10),
                Text('${book.title}',
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 10),
                Text('${book.author}',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text('${book.description}',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]),
        ));
  }
}
