import 'package:flutter/material.dart';
import 'package:tech_languages/routes.dart';
import 'package:tech_languages/screens/featured_screen/featured_screen.dart';

import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Languages',
      theme: theme(),
      initialRoute: FeaturedScreen.routeName,
      routes: routes,
    );
  }
}
