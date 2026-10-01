// level 1
class Author {
  final String name;
  final String? country;
  const Author({required this.name, this.country});

  @override
  String toString() => 'Author(name: $name, country: $country)';
}

enum Genre {
  craft('craft'),
  theory('theory'),
  unknown('unkwown');

  final String label;
  const Genre(this.label);

  static Genre fromString(String? raw) {
    return Genre.values.firstWhere(
      (g) => g.label == raw,
      orElse: () => Genre.unknown,
    );
  }
}

// level 2
class Book extends LibraryItem with Borrowable {
  final int pages;
  final Author author;
  final Genre genre;
  final String? description;

  const Book({
    required super.title,
    required super.year,
    required this.pages,
    required this.author,
    required this.genre,
    this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String? ?? 'Untitled',
      year: json['year'] as int? ?? 0,
      pages: json['pages'] as int? ?? 0,
      author: Author(
        name: json['author'] as String? ?? 'Unknown',
        country: json['country'] as String?,
      ),
      genre: Genre.fromString(json['genre'] as String?),
      description: json['description'] as String?,
    );
  }

  bool get isLong => (pages > 400);

  Book copyWith({
    String? title,
    int? year,
    int? pages,
    Author? author,
    Genre? genre,
    String? description,
  }) {
    return Book(
      title: title ?? this.title,
      year: year ?? this.year,
      pages: pages ?? this.pages,
      author: author ?? this.author,
      genre: genre ?? this.genre,
      description: description ?? this.description,
    );
  }

  @override
  String toString() =>
      'Book(title: $title, year: $year, pages: $pages, author: $author, genre: $genre)';

  @override
  String describe() {
    return '$title ($year) - $pages pages';
  }
}

abstract class LibraryItem {
  final String title;
  final int year;
  const LibraryItem({required this.title, required this.year});

  bool get isOld => (DateTime.now().year - year) > 18;
  String describe();
}

class Magazine extends LibraryItem {
  final String issue;

  const Magazine({
    required super.title,
    required super.year,
    required this.issue,
  });

  @override
  String describe() {
    return '$title ($year) - $issue pages';
  }
}

mixin Borrowable on LibraryItem {
  String BorrowLabel() => 'Borrowed - $title';
}

class Ghost implements LibraryItem {
  @override
  final String title;

  @override
  final int year;

  const Ghost({required this.title, required this.year});

  @override
  bool get isOld => (DateTime.now().year - year) > 18;

  @override
  String describe() => 'Ghost items: $title $year';
}
