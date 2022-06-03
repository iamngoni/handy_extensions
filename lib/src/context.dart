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

  /// Notify
  ///
  /// [message] is the message to display
  /// [duration] is the duration of the notification -> Defaults to 3 seconds
  /// [backgroundColor] is the background color of the notification -> Defaults to grey or red if it's an error
  /// [textColor] is the text color of the notification -> Defaults to white
  notify({
    required String message,
    Widget? content,
    Color? backgroundColor,
    Color? textColor,
    Duration? duration,
    bool isError = false,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: content ??
            Text(
              message,
              style: TextStyle(
                color: textColor ?? Colors.white,
              ),
            ),
        duration: duration ?? const Duration(seconds: 3),
        backgroundColor:
            backgroundColor ?? (isError ? Colors.red : Colors.grey),
      ),
    );
  }
}
