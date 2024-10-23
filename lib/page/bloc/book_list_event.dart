part of 'book_list_bloc.dart';

sealed class BookListEvent {}

class InitEvent extends BookListEvent {}

class SortByTitleEvent extends BookListEvent {}

class SortByAuthorEvent extends BookListEvent {}

class CheckDetailEvent extends BookListEvent {
  final Book book;
  CheckDetailEvent({required this.book});
}
