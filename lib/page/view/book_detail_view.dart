import 'package:book/mook_book.dart';
import 'package:book/page/bloc/book_list_bloc.dart';
import 'package:book/widget/book_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailView extends StatelessWidget {
  final Book book;
  const BookDetailView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                BlocProvider.of<BookListBloc>(context).selectedSort == "Author"
                    ? BlocProvider.of<BookListBloc>(context)
                        .add(SortByAuthorEvent())
                    : BlocProvider.of<BookListBloc>(context)
                        .add(SortByTitleEvent());
              }),
          title: const Text("Book Detail"),
          centerTitle: true,
          actions: [
            IconButton(icon: const Icon(Icons.account_circle), onPressed: () {})
          ]),
      body: BookDetailWidget(book: book),
    );
  }
}
