import 'package:flutter/material.dart';

extension HandyContextExtension on BuildContext {
  /// Height of device screen (y-axis)
  double get height => MediaQuery.of(this).size.height;

  /// Width of device screen (x-axis)
  double get width => MediaQuery.of(this).size.width;

  /// Navigate to a page
  ///
  /// [page] is the page to navigate to
  /// [replace=false] if true, the current page will be replaced by the new page
  ///
  goTo({
    required Widget page,
    bool replace = false,
  }) {
    return replace
        ? Navigator.of(this).pushReplacement(
            MaterialPageRoute(builder: (context) => page),
          )
        : Navigator.of(this).push(
            MaterialPageRoute(builder: (context) => page),
          );
  }

  /// Navigate to the previous page
  ///
  /// [value] is the value to pass to the previous page
  ///
  goBack({dynamic value}) {
    return Navigator.of(this).pop(value);
  }

  /// Navigate to a page and clear the history
  ///
  /// [page] is the page to navigate to
  ///
  goToRefresh({required Widget page}) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }
}
