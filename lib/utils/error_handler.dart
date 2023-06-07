import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  static void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text, style: const TextStyle(color: AppColors.white)),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void showGetUsersError(BuildContext context) =>
      _showSnackBar(context, 'Got error instead of users!');

  static void showGetUserDataError(BuildContext context) =>
      _showSnackBar(context, 'Got error instead of user data!');

  static void showGetCommentsError(BuildContext context) =>
      _showSnackBar(context, 'Got error instead of comments!');

  static void showPostCommentError(BuildContext context) =>
      _showSnackBar(context, 'Got error while submitting comment!');
}
