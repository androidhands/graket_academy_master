import 'package:flutter/material.dart';
import 'package:graket_academy_master/app_pages/home_pages/favorites_page.dart';
import 'package:graket_academy_master/app_pages/home_pages/home_page.dart';
import 'package:graket_academy_master/app_pages/home_pages/my_courses_page.dart';
import 'package:graket_academy_master/app_pages/home_pages/notifications_page.dart';
import 'package:graket_academy_master/app_pages/home_pages/settings_page.dart';
import 'package:graket_academy_master/app_pages/search_page.dart';
import 'package:graket_academy_master/components/colors.dart';
import 'package:graket_academy_master/core/firebase.dart';


class Home extends StatefulWidget {
  int index = 0;
  Home({Key? key, required this.index}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Database database = Database();

  @override
  Widget build(BuildContext context) {
    int currentIndex = widget.index;
    List<AppBar> appBars = [
      AppBar(
        backgroundColor: neutral5Color,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: neutral1Color),
        title: const Text(
          'Home',
          style: TextStyle(
              fontSize: 20, color: neutral1Color, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search),
              color: neutral1Color),
        ],
      ),
      AppBar(
        backgroundColor: neutral5Color,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: neutral1Color),
        title: const Text(
          'My Courses',
          style: TextStyle(
              fontSize: 20, color: neutral1Color, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: neutral1Color),
        ],
      ),
      AppBar(
        backgroundColor: neutral5Color,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: neutral1Color),
        title: const Text(
          'Favorites',
          style: TextStyle(
              fontSize: 20, color: neutral1Color, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: neutral1Color),
        ],
      ),
      AppBar(
        backgroundColor: neutral5Color,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: neutral1Color),
        title: const Text(
          'Notifications',
          style: TextStyle(
              fontSize: 20, color: neutral1Color, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: neutral1Color),
        ],
      ),
      AppBar(
        backgroundColor: neutral5Color,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: neutral1Color),
        title: const Text(
          'Settings',
          style: TextStyle(
              fontSize: 20, color: neutral1Color, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: neutral1Color),
        ],
      )
    ];
    bodys.clear();
    bodys.add(HomePage());
    bodys.add(const MyCoursesPage());
    bodys.add(const FavoritesPage());
    bodys.add(const NotificationsPage());
    bodys.add(const SettingsPage());
    return Scaffold(
      backgroundColor: neutral5Color,
      appBar: appBars[currentIndex],
      body: bodys[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (value) {
          setState(() {
            widget.index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: 'My Courses',
            icon: Icon(Icons.play_circle),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Notifications',
            icon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

  List<Widget> bodys = [];
}
