import 'package:bloc/bloc.dart';
import 'package:book/mook_book.dart';

part 'book_list_event.dart';
part 'book_list_state.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  //golable property
  List<Book> bookList = [];
  String selectedSort = "Author";

  void init() {
    bookList = List.generate(10, (index) {
      return Book.createMockBook();
    });
    bookList.sort((a, b) => a.author.compareTo(b.author));
  }

  BookListBloc() : super(Waiting()) {
    on<BookListEvent>((event, emit) {});

    on<InitEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1), () {});
      emit(BookList());
    });

    on<SortByTitleEvent>((event, emit) async {
      emit(Waiting());
      await Future.delayed(const Duration(seconds: 1), () {});
      bookList.sort((a, b) => a.title.compareTo(b.title));
      emit(BookList());
    });

    on<SortByAuthorEvent>((event, emit) async {
      emit(Waiting());
      await Future.delayed(const Duration(seconds: 1), () {});
      bookList.sort((a, b) => a.author.compareTo(b.author));
      emit(BookList());
    });

    on<CheckDetailEvent>((event, emit) async {
      emit(Waiting());
      await Future.delayed(const Duration(seconds: 1), () {});
      emit(BookDetail(book: event.book));
    });
  }
}
