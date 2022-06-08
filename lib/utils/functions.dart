import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class FunctionUtils {
  // static void callPhone(String phone) async {
  //   await launch("tel:$phone");
  // }
  static OverlaySupportEntry showSimpleNotification(
    Widget content, {
    /**
         * See more [ListTile.leading].
         */
    Widget? leading,
    /**
         * See more [ListTile.subtitle].
         */
    Widget? subtitle,
    /**
         * See more [ListTile.trailing].
         */
    Widget? trailing,
    /**
         * See more [ListTile.contentPadding].
         */
    EdgeInsetsGeometry? contentPadding,
    Color? background,
    /**
         * See more [ListTileTheme.textColor],[ListTileTheme.iconColor].
         */
    Color? foreground,
    /**
         * The elevation of notification, see more [Material.elevation].
         */
    double elevation = 16,
    Duration? duration,
    Key? key,
    /**
         * True to auto hide after duration [kNotificationDuration].
         */
    bool autoDismiss = true,
    /**
         * Support left/right to dismiss notification.
         */
    @Deprecated("use slideDismissDirection instead") bool slideDismiss = false,
    /**
         * The position of notification, default is [NotificationPosition.top],
         */
    NotificationPosition position = NotificationPosition.top,
    BuildContext? context,
    /**
         * The direction in which the notification can be dismissed.
         */
    DismissDirection? slideDismissDirection,
  }) {
    final dismissDirection = slideDismissDirection ??
        (slideDismiss ? DismissDirection.horizontal : DismissDirection.none);
    final entry = showOverlayNotification(
      (context) {
        return SlideDismissible(
          direction: dismissDirection,
          key: ValueKey(key),
          child: Material(
            elevation: elevation,
            child: ListTileTheme(
              child: ListTile(
                leading: leading,
                title: content,
                subtitle: subtitle,
                trailing: trailing,
                contentPadding: contentPadding,
              ),
            ),
          ),
        );
      },
      duration: autoDismiss ? duration : const Duration(seconds: 3),
      key: key,
      position: position,
      context: context,
    );
    return entry;
  }
}
