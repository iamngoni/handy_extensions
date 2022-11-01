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
- [double](https://api.flutter.dev/flutter/dart-core/double-class.html)
- [Iteration](https://api.flutter.dev/flutter/dart-core/Iterator-class.html)
- [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

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

### double

> Makes use of this package [money_formatter](https://pub.dev/packages/money_formatter)

#### Get Your Double Formatted As Money using the money property

```dart
10.money.symbolOnLeft; // => $ 10.00 (String)
1000.money.compactSymbolOnLeft; // => $ 1K (String)
```

#### Get comparison methods on your double using the compare property

```dart
10.compare.isEqual(10); // => true (bool)
```

Available methods for comparison:

- [isEqual](https://pub.dev/documentation/money_formatter/latest/money_formatter/MoneyFormatterCompare/isEqual.html)
- [isEqualOrGreaterThan](https://pub.dev/documentation/money_formatter/latest/money_formatter/MoneyFormatterCompare/isEqualOrGreaterThan.html)
- [isEqualOrLowerThan](https://pub.dev/documentation/money_formatter/latest/money_formatter/MoneyFormatterCompare/isEqualOrLowerThan.html)
- [isGreaterThan](https://pub.dev/documentation/money_formatter/latest/money_formatter/MoneyFormatterCompare/isGreaterThan.html)
- [isLowerThan](https://pub.dev/documentation/money_formatter/latest/money_formatter/MoneyFormatterCompare/isLowerThan.html)

### Iteration

#### firstWhereOrNull

```dart
List<String> list = ['a', 'b', 'c'];
String? character = list.firstWhereOrNull( (String item) => item == 'a'); // => 'a' (String) or null (null)
```

#### GroupBy

```dart
[1,2,3,4,5,6].groupBy((i) => i % 2 == 0); // {true: [2, 4, 6], false: [1, 3, 5]}
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

### General

#### Check if variable is null

```dart
String? name = null;
name.isNull; // => true (bool)
```

## Additional information

You can add in more extensions of your own -> share with the rest of the world.
