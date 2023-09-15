import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/user_screen.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../cart/CartScreen.dart';
import '../provider/dark_theme_provider.dart';
import '../screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'categories_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const HomeScreen(),
      'title': 'Home Screen',
    },
    {
      'page': const CategoriesScreen(),
      'title': 'Categories Screen',
    },
    {
      'page': const CartScreen(),
      'title': 'Cart Screen',
    },
    {
      'page': const UserScreen(),
      'title': 'user Screen',
    },
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     final themeState = Provider.of<DarkThemeProvider>(context);

     bool isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text( _pages[_selectedIndex]['title']),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        unselectedFontSize: 0.0,
        selectedFontSize: 0.0,
        backgroundColor: isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor: isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: isDark ? Colors.lightBlue.shade200 : Colors.black87,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
            Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,  color: Colors.blueGrey,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? IconlyBold.category
                : IconlyLight.category,
              color: Colors.blueGrey,),
            label: "category",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2
                ? IconlyBold.buy
                : IconlyLight.buy,
              color: Colors.blueGrey,),
            // Consumer<CartProvider>(builder: (_, myCart, ch) {
            //   return
            //     badges.Badge(
            //       badgeStyle: badges.BadgeStyle(
            //         // badges.toAnimate: true,
            //         shape: badges.BadgeShape.circle,
            //         badgeColor: Colors.blue,
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       position: badges.BadgePosition.topEnd(top: -7, end: -7),
            //       badgeContent: FittedBox(
            //           child: TextWidget(
            //               text: myCart.getCartItems.length.toString(),
            //               color: Colors.white,
            //               textSize: 15)),
            //       child: Icon(
            //           _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),);
            // }),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3
                    ? IconlyBold.user2
                    : IconlyLight.user2,
              color: Colors.blueGrey,
            ),
            label: "User",
          ),
        ],
      ),
    );
  }
}


