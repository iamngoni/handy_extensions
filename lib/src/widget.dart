//
//  widget
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/haptic_feedback_type.dart';

extension HandyWidgetExtensions on Widget {
  InkWell inkWell({
    required VoidCallback? onTap,
    required HapticFeedbackType hapticFeedbackType,
  }) {
    return InkWell(
      child: this,
      onTap: () async {
        onTap?.call();
        switch (hapticFeedbackType) {
          case HapticFeedbackType.light:
            await HapticFeedback.lightImpact();
            break;
          case HapticFeedbackType.medium:
            await HapticFeedback.mediumImpact();
            break;
          case HapticFeedbackType.heavy:
            await HapticFeedback.heavyImpact();
            break;
          case HapticFeedbackType.selection:
            await HapticFeedback.selectionClick();
            break;
          case HapticFeedbackType.vibrate:
            await HapticFeedback.vibrate();
            break;
        }
      },
    );
  }
}
