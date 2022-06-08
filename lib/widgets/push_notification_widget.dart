import 'package:flutter/material.dart';

enum PushNotificationType {
  // ignore: constant_identifier_names
  ERROR,
  // ignore: constant_identifier_names
  SUCCESS,
}

class PushNotificationWidget extends StatelessWidget {
  const PushNotificationWidget(
      {Key? key,
      this.type = PushNotificationType.SUCCESS,
      this.content,
      this.onTap,
      this.title})
      : super(key: key);

  /// Push notification type, default set to [PushNotificationType.SUCCESS]
  final PushNotificationType type;

  /// Content of notification
  final String? content;

  /// Content of notification
  final String? title;

  /// onTap notification
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: kToolbarHeight),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                blurRadius: 4,
                spreadRadius: 2,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Text(
                  title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              if (title != null && content != null)
                const SizedBox(
                  height: 5,
                ),
              if (content != null)
                Text(
                  content ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
