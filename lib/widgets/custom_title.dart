import 'package:flutter/material.dart';
import 'package:tech_languages/constants.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
    this.route = '/404',
    this.extend = true,
    this.fontSize = 20.0,
    this.arg,
  }) : super(key: key);

  final String title;
  final String route;
  final bool extend;
  final double fontSize;
  final arg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF132342),
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          (extend)
              ? GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   route,
                    //   arguments: arg,
                    // );
                  },
                  child: const Text(
                    'See More',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
