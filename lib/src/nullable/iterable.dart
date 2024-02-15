//
//  handy_extensions
//  iterable
//
//  Created by Ngonidzashe Mangudya on 16/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

extension NullableIterable<T> on Iterable<T?> {
  /// withoutNullElements
  ///
  /// Returns a new iterable with all the null elements removed.
  Iterable<T> withoutNullElements() => whereType<T>();
}
