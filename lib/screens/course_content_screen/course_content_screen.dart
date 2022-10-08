import 'package:flutter/material.dart';

import 'components/body.dart';

class CourseContentScreen extends StatefulWidget {
  const CourseContentScreen({Key? key}) : super(key: key);

  static String routeName = "/course_content";

  @override
  State<CourseContentScreen> createState() => _CourseContentScreenState();
}

class _CourseContentScreenState extends State<CourseContentScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
