import 'package:book/page/view/book_detail_view.dart';
import 'package:book/page/view/book_list_view.dart';
import 'package:book/page/view/waiting_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/book_list_bloc.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

//bloc
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookListBloc()
        ..init()
        ..add(InitEvent()),
      child: BlocBuilder<BookListBloc, BookListState>(
        builder: (context, state) {
          switch (state) {
            case Waiting():
              return const WaitingView();
            case BookList():
              //bookList: state.bookList
              return BookListView(
                  bookList: BlocProvider.of<BookListBloc>(context).bookList);
            // bookList: BlocProvider.of<BookListBloc>(context).bookList);
            case BookDetail():
              return BookDetailView(book: state.book);
            // default:
            //   return const Text('Error');
          }
        },
      ),
    );
  }
}
