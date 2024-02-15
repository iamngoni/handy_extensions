//
//  handy_extensions
//  int
//
//  Created by Ngonidzashe Mangudya on 15/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

extension NullableInt on int? {
  /// isInt
  ///
  /// Returns true if the value is not null
  bool get isInt => this != null;
}
