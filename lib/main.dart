import 'package:expense_tracker_fiap/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'theme/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, appBarTheme: kAppBarTheme),
      home: const HomePage(),
    );
  }
}
