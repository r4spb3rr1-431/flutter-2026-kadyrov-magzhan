import 'models.dart';

sealed class ShelfState {}

class Empty extends ShelfState {}

class Ready extends ShelfState {
  final List<Book> books;
  Ready(this.books);
}

class Broken extends ShelfState {
  final String message;
  Broken(this.message);
}

String describe(ShelfState state) => switch (state) {
  Empty() => 'The shelf is empty.',
  Ready(:final books) => 'Shelf is ready with ${books.length} books.',
  Broken(:final message) => 'Shelf is broken: $message',
};

({int count, double avgPages}) statsOf(List<Book> books) {
  final count = books.length;
  final avgPages = books.isEmpty
      ? 0.0
      : books.fold<int>(0, (sum, b) => sum + b.pages) / count;

  return (count: count, avgPages: avgPages);
}
