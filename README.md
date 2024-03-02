# [HandyExtensions](https://pub.dev/packages/handy_extensions/)

Developed with 💙 by [Ngonidzashe Mangudya](https://twitter.com/iamngoni_)

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
![coverage](coverage.svg)

---

<img src="https://img.shields.io/pub/v/handy_extensions?style=for-the-badge">
<img src="https://img.shields.io/github/last-commit/iamngoni/handy_extensions">
<img src="https://img.shields.io/twitter/url?label=iamngoni_&style=social&url=https%3A%2F%2Ftwitter.com%2Fiamngoni_">

Handy Extension is just a simple library with extensions to the core libraries to make them more handy and quicker to use.

> I don't know how "deadly" this is but I just use it anyway.

## Extensions On:

- [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
- [String](https://api.flutter.dev/flutter/dart-core/String-class.html)
- [int](https://api.flutter.dev/flutter/dart-core/int-class.html)
- [List](https://api.flutter.dev/flutter/dart-core/List-class.html)
- [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)

## Getting started

### Add as a dependency

```yaml
dependencies:
  handy_extensions: <version>
```

## Usage

### BuildContext

#### Navigate To A Page

```dart
context.goTo(page: const Home());
```

#### Navigate To A Page Replacing The Current Page

```dart
context.goTo(page: const Home(), replace: true);
```

#### Go Back To The Previous Page

```dart
context.goBack();
```

#### Navigate To A Page And Remove History

```dart
context.goToRefresh(page: const Login());
```

#### Notify The User Using A SnackBar

```dart
context.notify(message: 'Hello World', isError: false); // You can pass the isError argument or leave it, it will default to false
```

#### Get Screen Size (based on MediaQuery)

```dart
// Height
context.height;
// Width
context.width;
```

### String

#### Country Emoji

```dart
String country = 'ZW';
String emoji = country.countryEmoji; // => 🇿🇼 (String)
```

#### Title Case

```dart
String title = 'hello world';
String titleCase = title.titleCase; // => Hello world
```

#### Heading Case

```dart
String heading = 'hello world';
String headingCase = heading.headingCase; // => Hello World
```

#### doubleOrNull

```dart
String? number = '1';
double? doubleNumber = number.doubleOrNull; // => 1.0 (double) or null (null)
```

#### intOrNull

```dart
String? number = '1';
int? intNumber = number.intOrNull; // => 1 (int) or null (null)
```

### Map

#### swap
    
```dart
Map<String, int> map = {'a': 1, 'b': 2};
map.swap; // {1: 'a', 2: 'b'}
```

#### copy
    
```dart
Map<String, int> map = {'a': 1, 'b': 2};
map.copy; // {'a': 1, 'b': 2}
```

#### removeNulls
    
```dart
Map<String, int?> map = {'a': 1, 'b': null};
map.removeNulls; // {'a': 1}
```

#### adjustOrder
    
```dart
Map<String, int> map = {'a': 1, 'b': 2};
map.adjustOrder(1, 0); // {'b': 2, 'a': 1}
```

### List

#### Partition into chunks

```dart
[1,2,3,4,5,6].partition(chunkSize: 3); // => [[1,2,3],[4,5,6]] (List<List<int>>). By default it will partition into chunks of 2
```

#### Random Item

```dart
// Will return a random item from the list of type T
["Hello", "World", "iAMNGONI"].randomItem();
```

#### Random Items

```dart
// Will return a list of random items from the list of type T. By default this may return a
// list with only one item
["Hello", "World", "iAMNGONI"].randomItems(count: 2);
```

#### firstWhereOrNull

```dart
List<String> list = ['a', 'b', 'c'];
String? character = list.firstWhereOrNull( (String item) => item == 'a'); // => 'a' (String) or null (null)
```

#### groupBy

```dart
[1,2,3,4,5,6].groupBy((i) => i % 2 == 0); // {true: [2, 4, 6], false: [1, 3, 5]}
```

#### swap

```dart
List<int> list = [1, 2, 3, 4, 5];
list.swap(0, 4); // [5, 2, 3, 4, 1]
```

#### swapRange

```dart
List<int> list = [1, 2, 3, 4, 5];
list.swapRange(0, 2, 3); // [4, 5, 3, 1, 2]
```

#### hasDuplicates

```dart
List<int> list = [1, 2, 3, 4, 5, 1];
list.hasDuplicates; // true
```

#### intersperse

```dart
List<int> list = [1, 2, 3, 4, 5, 1];
list.intersperse(100);
// [1, 100, 2, 100, 3, 100, 4, 100, 5, 100, 1]
```

### Int

#### microsecond

```dart
Duration microsecond = 1.microsecond; // => 1
```

#### milliseconds

```dart
Duration milliseconds = 1.milliseconds; // => 1
```

#### seconds

```dart
Duration seconds = 1.seconds; // => 1
```

#### minutes

```dart
Duration minutes = 1.minutes; // => 1
```

#### hours

```dart
Duration hours = 1.hours; // => 1
```

#### days

```dart
Duration days = 1.days; // => 1
```

#### weeks

```dart
Duration weeks = 1.weeks; // => 1
```

#### Example usage of the above duration items

```dart
Duration duration = 1.weeks + 2.days + 3.hours + 4.minutes + 5.seconds + 6.milliseconds + 7.microseconds;
```

### General

#### Check if variable is null

```dart
String? name = null;
name.isNull; // => true (bool)
```

### Nullable Int

#### isInt

```dart
int? number = 1;
number.isInt; // => true (bool)
```

```dart
int? number = null;
number.isInt; // => false (bool)
```

### Nullable String

#### isString

```dart
String? name = 'Ngoni';
name.isString; // => true (bool)
```

```dart
String? name = null;
name.isString; // => false (bool)
```

### orEmpty

```dart
String? name = null;
name.orEmpty; // => '' (String)
```

```dart
String? name = 'Ngoni';
name.orEmpty; // => 'Ngoni' (String)
```

### isNotReallyEmpty

```dart
String? name = null;
name.isNotReallyEmpty; // => false (bool)
```

```dart
String? name = ' ';
name.isNotReallyEmpty; // => false (bool)
```

```dart
String? name = 'Ngoni';
name.isNotReallyEmpty; // => true (bool)
```

## Additional information

You can add in more extensions of your own -> share with the rest of the world.

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
