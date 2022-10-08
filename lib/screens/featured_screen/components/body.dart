import 'package:flutter/material.dart';
import 'package:tech_languages/constants.dart';
import 'package:tech_languages/models/courses_json.dart';
import 'package:tech_languages/size_config.dart';
import 'package:tech_languages/widgets/custom_course_card.dart';

import '../../../models/category.dart';
import '../../../widgets/category_card.dart';
import '../../../widgets/clipper.dart';
import '../../../widgets/custom_title.dart';
import '../../../widgets/icon_btn_with_counter.dart';
import '../../../widgets/search_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 270,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 74),
                    // Heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hey Gaurav,",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        IconBtnWithCounter(
                          svgSrc: "assets/icons/Bell.svg",
                          numOfItems: 5,
                          press: () {},
                        ),
                      ],
                    ),
                    const Text(
                      "Find a course you want to learn,",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 30),
                    const SearchTextField(), //Search Bar
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const CustomTitle(title: "Featured Courses"),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Row(
                children: List.generate(coursesJson.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child: CustomCourseCardExpand(
                      thumbNail: coursesJson[index]['image'],
                      videoAmount: coursesJson[index]['video'],
                      title: coursesJson[index]['title'],
                      userProfile: coursesJson[index]['user_profile'],
                      userName: coursesJson[index]['user_name'],
                      price: coursesJson[index]['price'],
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const CustomTitle(title: "Explore Categories"),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30),
              child: Row(
                children: List.generate(categoryList.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CategoryCard(
                      category: categoryList[index],
                    ),
                  );
                }),
              ),
            ),
          ),
          const CustomTitle(title: "Popular Courses"),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30),
              child: Row(
                children: List.generate(coursesJson.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CustomCourseCardExpand(
                      thumbNail: coursesJson[index]['image'],
                      videoAmount: coursesJson[index]['video'],
                      title: coursesJson[index]['title'],
                      userProfile: coursesJson[index]['user_profile'],
                      userName: coursesJson[index]['user_name'],
                      price: coursesJson[index]['price'],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
