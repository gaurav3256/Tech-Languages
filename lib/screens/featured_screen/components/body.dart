import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tech_languages/constants.dart';
import 'package:tech_languages/models/courses_json.dart';
import 'package:tech_languages/size_config.dart';
import 'package:tech_languages/util/base_url.dart';
import 'package:tech_languages/widgets/custom_course_card.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/clipper.dart';
import '../../../widgets/custom_title.dart';
import '../../../widgets/icon_btn_with_counter.dart';
import '../../../widgets/search_field.dart';
import '../../course_screen/course_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List categoryList = [];

  getAllCategory() async {
    var response = await http.get(Uri.parse(API.courseCategory));

    if (response.statusCode == 200) {
      setState(() {
        categoryList = jsonDecode(response.body);
      });
      //print(categoryList);
      return categoryList;
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

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
                  var size = MediaQuery.of(context).size;
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, CourseScreen.routeName),
                      child: Container(
                        width: size.width * .4,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10.0,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Image.network(
                                "${API.categoryImage}/${categoryList[index]["image_name"]}",
                                height: 100.0,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              categoryList[index]["category_name"],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '20 Courses',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
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
