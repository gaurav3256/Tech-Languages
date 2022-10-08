import 'package:flutter/material.dart';
import 'package:tech_languages/size_config.dart';

import '../../../models/course.dart';
import '../../../widgets/course_container.dart';
import '../../../widgets/custom_icon_button.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Stack(
                children: [
                  const Align(
                    child: Text(
                      'Development',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: CustomIconButton(
                      height: 35,
                      width: 35,
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return CourseContainer(course: courses[index]);
                },
                separatorBuilder: (context, _) {
                  return const SizedBox(height: 10);
                },
                itemCount: courses.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
