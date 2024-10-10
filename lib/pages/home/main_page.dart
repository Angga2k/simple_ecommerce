import 'package:flutter/material.dart';
import 'package:simple_ecommerce/pages/home/chat_page.dart';
import 'package:simple_ecommerce/pages/home/home_page.dart';
import 'package:simple_ecommerce/pages/home/profile_page.dart';
import 'package:simple_ecommerce/pages/home/wishlist_page.dart';
import 'package:simple_ecommerce/theme.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: backgroundColor4,
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 60,
            child: OverflowBox(
              maxHeight: 80,
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: backgroundColor4,
                currentIndex: currentIndex,
                onTap: (value) {
                  print(value);
                  setState(() {
                    currentIndex = value;
                  });
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Image.asset(
                        'assets/icon_home.png',
                        width: 20,
                        color: currentIndex == 0
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Image.asset(
                        'assets/icon_chat.png',
                        width: 20,
                        color: currentIndex == 1
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Image.asset(
                        'assets/icon_wishlist.png',
                        width: 20,
                        color: currentIndex == 2
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Image.asset(
                        'assets/icon_profile.png',
                        width: 18,
                        color: currentIndex == 3
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
