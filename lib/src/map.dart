//
//  handy_extensions
//  map
//
//  Created by Ngonidzashe Mangudya on 02/03/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

extension HandyMapExtension<K, V> on Map<K, V> {
  /// Returns a new map with the keys and values swapped.
  Map<V, K> get swap {
    return map((key, value) => MapEntry(value, key));
  }

  /// Returns a new map from the current map
  Map<K, V> get copy {
    return Map<K, V>.from(this);
  }

  /// Returns a new map with the null values removed.
  Map<K, V> get removeNulls {
    return Map<K, V>.fromEntries(
      entries.where((entry) => entry.value != null),
    );
  }

  /// Returns a new map with map order adjusted
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
}
