import 'package:book_app/app.dart';

import 'package:book_app/core/di/injection.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BookApp());
  // injection
  init();
}

// science
// sport
// programming
