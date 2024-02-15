//
//  handy_extensions
//  string
//
//  Created by Ngonidzashe Mangudya on 15/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

extension NullableString on String? {
  /// isString
  ///
  /// Returns true if the value is not null
  bool get isString => this != null;

  /// orEmpty
  ///
  /// Returns the value if it is not null, otherwise returns an empty string
  String get orEmpty => this ?? '';

  /// isNotReallyEmpty
  ///
  /// Returns true if the value is not null and not empty
  bool get isNotReallyEmpty => orEmpty.trim().isNotEmpty;
}
