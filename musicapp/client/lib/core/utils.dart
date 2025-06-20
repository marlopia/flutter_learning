import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String string) {
  ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(string)));
}