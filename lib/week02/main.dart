import 'catalogue.dart';
import 'data.dart';
import 'models.dart';
import 'shelf_state.dart';

void main() {
  final library = Library();

  for (final json in rawBooks) {
    library.add(Book.fromJson(json));
  }

  print('Level 4:');
  print(library.getEveryTitle);
  print('\n');
  print(library.getBooksAfter2010);
  print('\n');
  print(library.getAveragePages);
  print('\n');
  print(library.authorBooksCount);
  print('\n');
  print(library.distinctAuthors);
  print('\n');
  print(library.presentGenres);
  print('\n');
  print(library.displayList);

  print('\n\nLevel 5:');
  print(statsOf(library.books));
  print(describe(Empty()));
  print(describe(Ready(library.books)));
  print(describe(Broken('Shelf broke')));
}
