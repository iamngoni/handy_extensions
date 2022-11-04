# [HandyExtensions](https://pub.dev/packages/handy_extensions/)

Developed with 💙 by [Ngonidzashe Mangudya](https://twitter.com/iamngoni_)

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

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

### General

#### Check if variable is null

```dart
String? name = null;
name.isNull; // => true (bool)
```

## Additional information

You can add in more extensions of your own -> share with the rest of the world.
