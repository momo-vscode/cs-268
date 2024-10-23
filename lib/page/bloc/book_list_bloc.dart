import 'package:bloc/bloc.dart';
import 'package:book/mook_book.dart';

part 'book_list_event.dart';
part 'book_list_state.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  //golable property
  List<Book> bookList = [];

  void init() {
    bookList = List.generate(10, (index) {
      return Book.createMockBook();
    });
    bookList.sort((a, b) => a.author.compareTo(b.author));
  }

  BookListBloc() : super(Waiting()) {
    on<BookListEvent>((event, emit) {});

    on<InitEvent>((event, emit) {
      emit(BookList());
    });

    on<SortByTitleEvent>((event, emit) {
      emit(Waiting());
      bookList.sort((a, b) => a.title.compareTo(b.title));
      emit(BookList());
    });

    on<SortByAuthorEvent>((event, emit) {
      emit(Waiting());
      bookList.sort((a, b) => a.author.compareTo(b.author));
      emit(BookList());
    });

    on<CheckDetailEvent>((event, emit) {
      emit(BookDetail(book: event.book));
    });
  }
}
