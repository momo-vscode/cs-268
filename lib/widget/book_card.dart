import 'package:book/mook_book.dart';
import 'package:flutter/material.dart';

//card can be different size by change the height/width property, which nullable
class BookCard extends StatelessWidget {
  final Book book;
  final double? height;
  final double? width;
  const BookCard({super.key, required this.book, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 220,
      width: width ?? 130,
      child: Card(
        child: Stack(
          children: [
            // Book image
            Image.network(
              book.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Title and author text
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text('${book.title}'),
                    SizedBox(height: 80),
                    Text('${book.author}'),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
