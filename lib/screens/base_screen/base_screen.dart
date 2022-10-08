import 'package:flutter/material.dart';
import 'components/body.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  static String routeName = "/base";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}


/*
class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  static String routeName = "/base";

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOption = <Widget>[
    const FeaturedScreen(),
    const FeaturedScreen(),
    const FeaturedScreen(),
    const FeaturedScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Color inActiveIconColor = Color(0xFFB6B6B6);

    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState
              .home), /*BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/star_outlined.png',
              height: kBottomNavigationBarItemSize,
              color: _selectedIndex == 0 ? kPrimaryColor : inActiveIconColor,
            ),
            label: 'Featured',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/play_outlined.png',
              height: kBottomNavigationBarItemSize,
              color: _selectedIndex == 1 ? kPrimaryColor : inActiveIconColor,
            ),
            label: 'My Learning',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/heart_outlined.png',
              height: kBottomNavigationBarItemSize,
              color: _selectedIndex == 2 ? kPrimaryColor : inActiveIconColor,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/account.png',
              height: kBottomNavigationBarItemSize,
              color: _selectedIndex == 3 ? kPrimaryColor : inActiveIconColor,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),*/
    );
  }
}*/
