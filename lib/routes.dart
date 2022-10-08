import 'package:flutter/widgets.dart';
import 'screens/course_content_screen/course_content_screen.dart';
import 'screens/base_screen/base_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/course_screen/course_screen.dart';
import 'screens/detail_screen/detail_screen.dart';
import 'screens/featured_screen/featured_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  BaseScreen.routeName: (context) => const BaseScreen(),
  FeaturedScreen.routeName: (context) => const FeaturedScreen(),
  CourseScreen.routeName: (context) => const CourseScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  DetailScreen.routeName: (context) => const DetailScreen(
        title: '',
      ),
  CourseContentScreen.routeName: (context) => const CourseContentScreen(),

  //SplashScreen.routeName: (context) => const SplashScreen(),
  //OTPScreen.routeName: (context) => const OTPScreen(),
  //CartScreen.routeName: (context) => const CartScreen(),

  //MyCourseScreen.routeName: (context) => const MyCourseScreen(),
};
