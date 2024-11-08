//
//  handy_extensions
//  map
//
//  Created by Ngonidzashe Mangudya on 02/03/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

extension HandyMapExtension<K, V> on Map<K, V> {
  /// Creates a new map with the keys and values swapped.
  ///
  /// This getter returns a new map where each key becomes a value and each
  /// value becomes a key. Note that if the original map has duplicate values,
  /// some key-value pairs may be lost in the resulting map.
  ///
  /// Example:
  /// ```dart
  /// final original = {'a': 1, 'b': 2, 'c': 3};
  /// final swapped = original.swap;
  /// print(swapped); // Output: {1: 'a', 2: 'b', 3: 'c'}
  /// ```
  ///
  /// Returns a [Map<V, K>] with swapped keys and values.
  Map<V, K> get swap {
    return map((key, value) => MapEntry(value, key));
  }

  /// Creates a shallow copy of the current map.
  ///
  /// This getter returns a new map with the same key-value pairs as the
  /// original. Modifying the new map does not affect the original map.
  ///
  /// Example:
  /// ```dart
  /// final original = {'a': 1, 'b': 2};
  /// final copied = original.copy;
  /// copied['c'] = 3;
  /// print(original); // Output: {'a': 1, 'b': 2}
  /// print(copied);   // Output: {'a': 1, 'b': 2, 'c': 3}
  /// ```
  ///
  /// Returns a new [Map<K, V>] with the same entries as the original map.
  Map<K, V> get copy {
    return Map<K, V>.from(this);
  }

  /// Creates a new map with null values removed.
  ///
  /// This getter returns a new map containing all key-value pairs from the
  /// original map except those where the value is null.
  ///
  /// Example:
  /// ```dart
  /// final original = {'a': 1, 'b': null, 'c': 3};
  /// final nonNull = original.removeNulls;
  /// print(nonNull); // Output: {'a': 1, 'c': 3}
  /// ```
  ///
  /// Returns a new [Map<K, V>] with all non-null entries from the original map.
  Map<K, V> get removeNulls {
    return Map<K, V>.fromEntries(
      entries.where((entry) => entry.value != null),
    );
  }

  /// Creates a new map with the order of entries adjusted.
  ///
  /// This method moves an entry from the [from] index to the [to] index.
  /// If [to] is greater than [from], it's decremented by 1 to account for
  /// the removal of the item at [from].
  ///
  /// Example:
  /// ```dart
  /// final original = {'a': 1, 'b': 2, 'c': 3, 'd': 4};
  /// final adjusted = original.adjustOrder(1, 3);
  /// print(adjusted); // Output: {'a': 1, 'c': 3, 'd': 4, 'b': 2}
  /// ```
  ///
  /// Parameters:
  ///   - [from]: The current index of the entry to move.
  ///   - [to]: The desired new index for the entry.
  ///
  /// Returns a new [Map<K, V>] with the adjusted order of entries.
  Map<K, V> adjustOrder(int from, int to) {
    int to0 = to;
    if (to0 > from) {
      to0 -= 1;
    }

    final entries = this.entries.toList();
    final item = entries.removeAt(from);
    entries.insert(to0, item);
    final Map<K, V> updated = Map.fromEntries(entries);
    return updated;
  }

  /// Get a value from the map or return a default value if the key is not found.
  ///
  /// This method returns the value associated with the given key if it exists
  /// in the map. If the key is not found, it returns the [defaultValue] instead.
  ///
  /// Example:
  /// ```dart
  /// final map = {'a': 1, 'b': 2};
  /// final value = map.getOrDefault('a', 0);
  /// print(value); // Output: 1
  /// ```
  ///
  /// Parameters:
  ///  - [key]: The key to look up in the map.
  ///  - [defaultValue]: The value to return if the key is not found.
  ///
  /// Returns the value associated with the key, or the [defaultValue] if the
  /// key is not found.
  T? getOrDefault<T>(K key, [T? defaultValue]) {
    if (containsKey(key)) {
      if (this[key] != null) {
        return this[key] as T;
      }
      return defaultValue;
    }
    return defaultValue;
  }
}
