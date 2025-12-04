# [HandyExtensions](https://pub.dev/packages/handy_extensions/)

Developed with 💙 by [Ngonidzashe Mangudya](https://twitter.com/iamngoni_)

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![codecov](https://codecov.io/gh/iamngoni/handy_extensions/graph/badge.svg?token=8MVBOJFQC7)](https://codecov.io/gh/iamngoni/handy_extensions)

---

<img src="https://img.shields.io/pub/v/handy_extensions?style=for-the-badge">
<img src="https://img.shields.io/github/last-commit/iamngoni/handy_extensions">
<img src="https://img.shields.io/twitter/url?label=iamngoni_&style=social&url=https%3A%2F%2Ftwitter.com%2Fiamngoni_">

Handy Extension is a comprehensive library with extensions to Dart's core types and Flutter's BuildContext to make development more efficient and code more readable.

> I don't know how "deadly" this is but I just use it anyway.

## Extensions On:

- [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
- [String](https://api.flutter.dev/flutter/dart-core/String-class.html)
- [int/num](https://api.flutter.dev/flutter/dart-core/num-class.html)
- [List](https://api.flutter.dev/flutter/dart-core/List-class.html)
- [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)
- [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)
- [Iterable](https://api.flutter.dev/flutter/dart-core/Iterable-class.html)
- Nullable types (String?, int?, List?, Iterable?)
- General extensions for any type

## Getting started

### Add as a dependency

```yaml
dependencies:
  handy_extensions: <version>
```

## Usage

### BuildContext

#### Get Screen Dimensions

```dart
// Get screen height
double screenHeight = context.height;

// Get screen width
double screenWidth = context.width;
```

### String

#### Country Code to Emoji

```dart
String country = 'ZW';
String emoji = country.countryEmoji; // => 🇿🇼
```

#### Text Case Transformations

```dart
String title = 'hello world';
String titleCase = title.titleCase; // => Hello world
String headingCase = title.headingCase; // => Hello World
```

#### String Parsing

```dart
String number = '42.5';

// Check if string is numeric
bool isNum = number.isNumeric; // => true

// Parse to double or int safely
double? doubleValue = number.toDoubleOrNull; // => 42.5
int? intValue = '42'.toIntOrNull; // => 42
```

#### String Comparisons

```dart
String text = 'Hello';

// Case-insensitive matching
bool matches = text.matches('hello'); // => true

// Check if all uppercase
bool isUpper = 'HELLO'.isAllCaps; // => true

// Check if strings have same characters (different order)
bool sameChars = 'hello'.hasSameCharacters('olleh'); // => true
```

#### String Selection

Select and manipulate substrings using string markers instead of integer indices:

```dart
// Remove script tags from HTML
String input = 'Price: ZAR 1374.94.<script>alert(1);</script> Check In:';
String clean = input.select(start: '<script', end: '</script>')?.remove();
// => 'Price: ZAR 1374.94. Check In:'

// Get the selected text including markers
String html = 'Hello <b>World</b> Goodbye';
String? selected = html.select(start: '<b>', end: '</b>')?.selected;
// => '<b>World</b>'

// Get content between markers (excluding markers)
String? content = html.select(start: '<b>', end: '</b>')?.content('<b>', '</b>');
// => 'World'

// Replace selection
String? replaced = html.select(start: '<b>', end: '</b>')?.replace('Universe');
// => 'Hello Universe Goodbye'

// Remove all occurrences
String multi = 'A<x>1</x>B<x>2</x>C';
String? cleaned = multi.select(start: '<x>', end: '</x>')?.removeAll('<x>', '</x>');
// => 'ABC'

// Replace all occurrences
String? allReplaced = multi.select(start: '<x>', end: '</x>')?.replaceAll(
  start: '<x>',
  end: '</x>',
  replacement: '[]',
);
// => 'A[]B[]C'
```

### List

#### Partitioning

```dart
List<int> numbers = [1, 2, 3, 4, 5, 6];

// Split into chunks
List<List<int>> chunks = numbers.partition(chunkSize: 3); 
// => [[1, 2, 3], [4, 5, 6]]

// Partition based on condition
List<List<int>> evenOdd = numbers.partitionWhere((n) => n.isEven);
// => [[2, 4, 6], [1, 3, 5]]

// Split into equal-sized sublists
List<List<int>> split = numbers.splitInto(chunkSize: 2);
// => [[1, 2, 3], [4, 5, 6]]
```

#### Random Selection

```dart
List<String> words = ["Hello", "World", "Dart"];

// Get random item
String randomWord = words.randomItem();

// Get multiple random items (no duplicates)
List<String> randomWords = words.randomItems(count: 2);
```

#### Safe Operations

```dart
List<String> items = ['a', 'b', 'c'];

// Safe first where operation
String? found = items.firstWhereOrNull((item) => item == 'a'); // => 'a'

// Safe index access
String? item = items.getAt(1); // => 'b'
String? invalid = items.getAt(10); // => null

// Check if index is valid
bool valid = items.isValidIndex(1); // => true
```

#### Grouping and Organization

```dart
List<Map<String, dynamic>> movies = [
  {"title": "Avengers", "year": "2019"},
  {"title": "Creed", "year": "2019"},
  {"title": "Jumanji", "year": "2020"},
];

// Group by field
Map<String, List<Map<String, dynamic>>> grouped = 
    movies.groupBy((m) => m["year"]);
```

#### List Manipulation

```dart
List<int> numbers = [1, 2, 3, 4, 5];

// Swap elements
numbers.swap(0, 4); // [5, 2, 3, 4, 1]

// Swap ranges
numbers.swapRange(0, 2, 3); // [4, 5, 3, 1, 2]

// Check for duplicates
bool hasDups = [1, 2, 3, 2].hasDuplicates(); // => true

// Check if contains any of multiple items
bool containsAny = numbers.containsSome([6, 7, 8]); // => false

// Compare lists regardless of order
bool same = [1, 2, 3].same([3, 1, 2]); // => true
```

#### Update Operations

```dart
List<int> numbers = [1, 2, 3, 4, 5];

// Update elements matching condition
numbers.updateWhere(
  (n) => n.isEven,  // predicate
  (n) => n * 2,     // update function
);
// Result: [1, 4, 3, 8, 5]

// Update or create if no matches found
List<String> users = ['alice', 'bob'];
bool updated = users.updateWhereOrCreate(
  (user) => user.startsWith('c'),
  (user) => user.toUpperCase(),
  () => 'charlie', // created if no 'c' names found
);
```

### Map

#### Map Transformations

```dart
Map<String, int> original = {'a': 1, 'b': 2, 'c': 3};

// Swap keys and values
Map<int, String> swapped = original.swap; // {1: 'a', 2: 'b', 3: 'c'}

// Create a copy
Map<String, int> copied = original.copy;

// Remove null values
Map<String, int?> withNulls = {'a': 1, 'b': null, 'c': 3};
Map<String, int?> cleaned = withNulls.removeNulls; // {'a': 1, 'c': 3}
```

#### Map Operations

```dart
Map<String, int> map = {'a': 1, 'b': 2, 'c': 3, 'd': 4};

// Reorder entries
Map<String, int> reordered = map.adjustOrder(1, 3);

// Get value or default
int value = map.getOrDefault('e', 0); // => 0
```

### DateTime

#### Readable Formats

```dart
DateTime date = DateTime(2022, 3, 15, 14, 30, 45);

// Various readable formats
String readable = date.readableDate; // => Tuesday 15 March 2022
String readableDateTime = date.readableDateTime; // => March 15, 2022 14:30:45
String time = date.readableTime; // => 14:30:45
String timeFormat = date.timeFormat; // => 02:30pm
String combined = date.readableDateTimeFormat; // => Tuesday 15 March 2022, 02:30pm
```

#### Date Components

```dart
DateTime date = DateTime(2022, 3, 15);

// Get components
String day = date.getDay; // => Tuesday
String shortDay = date.getShortDay; // => Tue
int dayOfMonth = date.getDate; // => 15
String month = date.getMonth; // => March
String shortMonth = date.getShortMonth; // => Mar
String year = date.getYear; // => 2022
```

#### Time Intelligence

```dart
DateTime now = DateTime.now();
DateTime past = now.subtract(Duration(hours: 2));

// Time ago
String ago = past.timeAgo; // => 2h

// Time of day
String timeOfDay = DateTime(2022, 1, 1, 9, 0).timeOfDayStr; // => Morning
String emoji = DateTime(2022, 1, 1, 21, 0).timeOfDayEmoji; // => 🌙

// Smart description
String desc = past.describe; // => 02:30pm (for today) or Yesterday, etc.
```

#### Date Comparisons

```dart
DateTime date1 = DateTime(2022, 3, 15, 9, 0);
DateTime date2 = DateTime(2022, 3, 15, 18, 0);
DateTime date3 = DateTime(2022, 3, 16);

// Check if same day (ignoring time)
bool sameDay = date1.isSameDayForYear(date2); // => true

// Check if same day/month (ignoring year)
bool sameDayMonth = date1.isSameDay(DateTime(2023, 3, 15)); // => true

// Check if between dates
bool between = date1.isBetween(
  DateTime(2022, 1, 1), 
  DateTime(2022, 12, 31)
); // => true
```

### Num/Int

#### Duration Creation

```dart
// Create durations easily
Duration micro = 500.microseconds;
Duration milli = 1500.milliseconds; // or 1500.ms
Duration sec = 30.seconds;
Duration min = 5.minutes;
Duration hr = 2.hours;
Duration day = 3.days;
Duration week = 2.weeks;
Duration month = 1.months; // ~30.44 days
Duration year = 1.years; // calculated based on current date

// Combine durations
Duration total = 1.weeks + 2.days + 3.hours + 4.minutes;
```

#### Number Operations

```dart
// Check if number is in range
bool inRange = 5.isBetween(1, 10); // => true
```

### Iterable

#### Interspersing Elements

```dart
List<String> words = ["Hello", "World", "Dart"];

// Insert separator between elements
Iterable<String> withCommas = words.intersperse(",");
// Result: [Hello, ,, World, ,, Dart]

// Insert separators conditionally
Iterable<int> numbers = [1, 2, 3, 4, 5];
Iterable<dynamic> conditional = numbers.intersperseWith(
  (n) => n.isEven ? ':' : null
);
// Result: [1, 2, :, 3, 4, :, 5]

// Insert at specific index
Iterable<String> atIndex = words.intersperseAt(1, '-');
// Result: [Hello, World, -, Dart]

// Insert at end
Iterable<String> atEnd = words.intersperseAtLast('!');
// Result: [Hello, World, Dart, !]
```

### Nullable Extensions

#### Nullable String

```dart
String? name = null;
String? greeting = 'Hello';

// Check if string (not null)
bool isString = name.isString; // => false
bool isGreeting = greeting.isString; // => true

// Get value or empty string
String safe = name.orEmpty; // => ''
String value = greeting.orEmpty; // => 'Hello'

// Check if not null and not empty/whitespace
bool hasContent = name.isNotReallyEmpty; // => false
bool greetingHasContent = greeting.isNotReallyEmpty; // => true
```

#### Nullable Int

```dart
int? number = null;
int? value = 42;

// Check if int (not null)
bool isInt = number.isInt; // => false
bool isValue = value.isInt; // => true
```

#### Nullable List

```dart
List<int?> numbers = [1, null, 3, 4];

// Find first element matching condition (handles nulls safely)
int? firstEven = numbers.firstOrNullWhere((n) => n != null && n.isEven); // => 4
int? firstNull = numbers.firstOrNullWhere((n) => n == null); // => null
```

#### Nullable Iterable

```dart
Iterable<String?> items = ['hello', null, 'world', null];

// Remove all null elements
Iterable<String> nonNull = items.withoutNullElements();
// Result: ['hello', 'world']
```

### General Extensions

Available on any type:

```dart
// Apply a function to any value
int result = 5.let((it) => it * 2); // => 10

String processed = "hello".let((s) => s.toUpperCase()); // => "HELLO"

// Check if any value is null
bool isNull = someValue.isNull;
```

## Utility Types

The library also includes utility enums:

```dart
enum HapticFeedbackType {
  light,
  medium,
  heavy,
  selection,
  vibrate,
}
```

## Additional Information

This library provides over 100 extension methods across Dart's core types and Flutter's BuildContext. All extensions are designed to be intuitive, well-documented, and thoroughly tested.

You can contribute additional extensions to help make Dart development even more efficient!

---

[dart_install_link]: https://dart.dev/get-dart
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows