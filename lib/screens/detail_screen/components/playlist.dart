import 'package:flutter/material.dart';

import '../../../models/lesson.dart';
import 'lesson_card.dart';

class Playlist extends StatelessWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20, bottom: 90),
        itemBuilder: (_, index) {
          return LessonCard(
            lesson: lessonList[index],
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(height: 20);
        },
        itemCount: lessonList.length,
      ),
    );
  }
}
