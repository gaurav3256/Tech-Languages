import 'package:flutter/material.dart';
import 'package:tech_languages/components/default_button.dart';
import 'package:tech_languages/screens/course_content_screen/course_content_screen.dart';

import '../../../widgets/custom_icon_button.dart';

class EnrollBottomSheet extends StatefulWidget {
  const EnrollBottomSheet({Key? key}) : super(key: key);

  @override
  _EnrollBottomSheetState createState() => _EnrollBottomSheetState();
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Row(
        children: [
          CustomIconButton(
            onTap: () {},
            height: 45,
            width: 45,
            child: const Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: DefaultButton(
              text: "Enroll Now",
              press: () {
                Navigator.pushNamed(context, CourseContentScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
