// level 3
import 'package:test_app/week02/models.dart';

class Library {
  final List<LibraryItem> items = [];
  String? cachedReport;

  void add(LibraryItem item) {
    items.add(item);
  }

  Book? findByTitle(String title) {
    for (final item in items) {
      if (item is Book && item.title == title) {
        return item;
      }
    }
    return null;
  }

  String contryOf(String title) =>
      findByTitle(title)?.author.country ?? 'unknown';

  String getReport() {
    cachedReport ??= 'Library opened with ${items.length} items.';
    return cachedReport!;
  }

  // level 4
  List<Book> get books => items.whereType<Book>().toList();

  List<String> get getEveryTitle => items.map((item) => item.title).toList();
  List<Book> get getBooksAfter2010 =>
      books.where((b) => b.year > 2010).toList();
  double get getAveragePages => books.isEmpty
      ? 0.0
      : books.fold<int>(0, (sum, b) => sum + b.pages) / books.length;
  Map<String, int> get authorBooksCount =>
      books.fold<Map<String, int>>({}, (map, b) {
        map[b.author.name] = (map[b.author.name] ?? 0) + 1;
        return map;
      });

  Set<String> get distinctAuthors => books.map((b) => b.author.name).toSet();

  Set<Genre> get presentGenres => books.map((b) => b.genre).toSet();

  List<String> get displayList => [
    'CATALOGUE',
    for (final book in books) '${book.title} (${book.year})',
    ...distinctAuthors,
    if (books.any((book) => book.pages == 0)) '(incomplete data)',
  ];
}
