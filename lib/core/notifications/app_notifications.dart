import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class AppNotifications {
  static void _showNotification(
    String message, {
    bool error = false,
    required Color backgroundColor,
    Duration? duration,
    bool autoDimiss = true,
  }) {
    showSimpleNotification(
      Text(message),
      autoDismiss: autoDimiss,
      background: backgroundColor,
      duration: duration ?? const Duration(seconds: 3),
      leading: error ? const Icon(Icons.info_outline) : null,
      position: NotificationPosition.bottom,
    );
  }

  static void showToastError(String message, {Duration? duration}) {
    _showNotification(
      message,
      duration: duration,
      backgroundColor: Colors.red,
    );
  }

  static void showToastAlert(String message, {Duration? duration}) {
    _showNotification(
      message,
      error: false,
      duration: duration,
      backgroundColor: Colors.amber[600]!,
    );
  }

  static void showToastSucess(String message, {Duration? duration}) {
    _showNotification(
      message,
      error: false,
      duration: duration,
      backgroundColor: Colors.green,
    );
  }
}
