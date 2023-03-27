import 'package:flutter/material.dart';

import '../constants/global_keys.dart';

void showSnackBar(String message) {
  scaffoldMessengerKey.currentState!
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
}
