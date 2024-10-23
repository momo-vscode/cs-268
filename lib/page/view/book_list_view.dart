import 'package:book/mook_book.dart';
import 'package:book/page/bloc/book_list_bloc.dart';
import 'package:book/widget/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListView extends StatefulWidget {
  final List<Book> bookList;
  const BookListView({
    super.key,
    required this.bookList,
  });

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  String selectedSort = "Author";

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BookListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        title: const Text("Book Club Home"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Row(children: [
              const SizedBox(width: 10),
              Text("Sort by", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(width: 10),
              ElevatedButton(
                  child: const Text("Author"),
                  onPressed: () {
                    setState(() {
                      selectedSort = "Author";
                    });
                    bloc.add(SortByAuthorEvent());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: selectedSort == "Author"
                          ? const Color.fromARGB(255, 243, 219, 247)
                          : null)),
              const SizedBox(width: 10),
              ElevatedButton(
                  child: const Text("Title"),
                  onPressed: () {
                    setState(() {
                      selectedSort = "Title";
                    });
                    bloc.add(SortByTitleEvent());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: selectedSort == "Title"
                          ? const Color.fromARGB(255, 243, 219, 247)
                          : null)),
            ]),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Books",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Container(
              height: 220,
              //width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.bookList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => bloc
                        .add(CheckDetailEvent(book: widget.bookList[index])),
                    child: (Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 8 : 0),
                        child: BookCard(book: widget.bookList[index]))),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            )
          ]),
    );
  }
}
