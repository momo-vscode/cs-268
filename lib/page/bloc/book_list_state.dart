part of 'book_list_bloc.dart';

sealed class BookListState {}

final class BookList extends BookListState {}

final class BookDetail extends BookListState {
  final Book book;
  BookDetail({required this.book});
}

final class Waiting extends BookListState {}
