## 0.2.20
- add `List.firstOrNullWhere` method

## 0.2.19
- add `List.updateWhere` method

## 0.2.18
- update `Map.getOrDefault` method

## 0.2.17
- add `String.hasSameCharacters` method

## 0.2.16
- fix: trim strings on `String.matches`

## 0.2.15
- add `List.partitionWhere` method to partition a list into two lists based on a predicate

## 0.2.14
- fix `Map.getOrDefault` method to return default value if value for key is `null`

## 0.2.13
- add `String.isAllCaps` method

## 0.2.12
- add `Map.getOrDefault` method

## 0.2.11
- Bug fix: Consider leap years in `Num.years` to avoid losing a day every 4 years

## 0.2.10
- add `Iterable.intersperseAtLast` method

## 0.2.9
- add `Iterable.intersperseWith` method
- add `Iterable.intersperseAt` method
- update documentation for all extensions
- remove `TimeOfDay` extensions

## 0.2.8
- add `List.containsSome` method

## 0.2.7
- fix missing `TimeOfDay` export

## 0.2.6
- add `TimeOfDay.isBefore` method
- add tests for `DateTime` extensions

## 0.2.5
- add `DateTime.isSameDayForYear` method

## 0.2.4
- add `DateTime.isSameDay` method

## 0.2.3
- add `String?.matches` method

## 0.2.2
- add `String.doubleOrNull` method
- add `String.intOrNull` method
- add `Map.swap` method
- add `Map.copy` method
- add `Map.removeNulls` method
- add `Map.adjustOrder(int from, int to)` method

## 0.2.1
- add `Iterable?.withoutNullElements` method

## 0.2.0
- export missing nullable extensions

## 0.1.9

- add `int?.isInt` method
- add `String?.isString` method
- add `String?.orEmpty` method
- add `String?.isNotReallyEmpty` method

## 0.1.8

- add `num.months` method
- add `num.years` method

## 0.1.7

- add `List.intersperse` method

## 0.1.6

- remove `BuildContext` routing methods

## 0.1.5+3

- fix `BuildContext.push` methods to add route settings

## 0.1.5+2

- add `DateTime.readableDateTimeFormat` method

## 0.1.5+1

- fix `DateTime.timeFormat` method, pad hours & minutes with 0

## 0.1.5

- add `DateTime.describe` method
- add `DateTime.timeFormat` method

## 0.1.4

- add `DateTime.isBetween` method

## 0.1.3+1

- fix `Widget.inkWell` method

## 0.1.3

- add `Widget.inkWell` method

## 0.1.2

- add `DateTime.timeOfDay` and `DateTime.timeOfDayEmoji` methods

## 0.1.1+1

- fix `List.splitInto` method

## 0.1.1

- new `List.splitInto` method

## 0.1.0

- use Very Good Analysis for linting
- change `BuildContext.notify` success color to `Colors.green`

## 0.0.9

- new `String.isNumeric` method

## 0.0.8+1

- Updated `DateTime.timeAgo` method to cater for negative difference in days.

## 0.0.8

- Added `List.swap` and `List.swapRange` methods.
- Added `List.hasDuplicates` getter.
- Added `int.microsecond`, `int.milliseconds`, `int.seconds`, `int.minutes`, `int.hours`, `int.days` getters.

## 0.0.7

- Added `List.groupBy` method.
- Added `List.randomItem` method.
- Added `List.randomItems` method.
- **Breaking Changes**: removed extensions for double which were making use of the money formatter package

## 0.0.6

- Fix: add proper return type on the partition method
- Add new getter on any type to check if variable is null

## 0.0.5+1

- Updated datetime extensions

## 0.0.5

- General Extensions
- Check equality on lists sorted differently

## 0.0.4+1

- Bug fixed

## 0.0.4

- List extension for partition list into chunks

## 0.0.3

- Time ago extension on DateTime

## 0.0.2

- DateTime extension

## 0.0.1

- Initial release
