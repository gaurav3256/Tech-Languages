import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_languages/screens/featured_screen/featured_screen.dart';
import 'package:tech_languages/screens/sign_in/sign_in_screen.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, FeaturedScreen.routeName),
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                height: 25,
                color: MenuState.featured == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                /*
                  Navigator.pushNamed(context, WishList.routeName),
                */
              },
              icon: SvgPicture.asset(
                "assets/icons/Heart Icon.svg",
                color: MenuState.wishlist == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                /*
                  Navigator.pushNamed(context, MyCourseScreen.routeName),
                */
              },
              icon: SvgPicture.asset(
                "assets/icons/play.svg",
                height: 25,
                color: MenuState.mylearning == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, SignInScreen.routeName),
              icon: SvgPicture.asset(
                "assets/icons/account.svg",
                height: 25,
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
