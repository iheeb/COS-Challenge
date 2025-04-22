import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showInfo(BuildContext context, String message) {
    _showSnackBar(context, message, color: Colors.blue);
  }

  static void showWarning(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      color: Colors.amber.shade700,
      icon: Icons.warning_amber_rounded,
    );
  }

  static void showError(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      color: Colors.red.shade600,
      icon: Icons.error_outline,
    );
  }

  static void _showSnackBar(
    BuildContext context,
    String message, {
    required Color color,
    IconData? icon,
  }) {
    final snackBar = SnackBar(
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      duration: const Duration(seconds: 4),
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
