import 'package:flutter/material.dart';
import 'package:graket_academy_master/app_pages/home_pages/home_page.dart';
import 'package:graket_academy_master/app_pages/search_page.dart';
import 'package:graket_academy_master/components/colors.dart';
import 'package:graket_academy_master/core/firebase.dart';


class Home extends StatefulWidget {

  const Home({Key? key,}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Database database = Database();

  @override
  Widget build(BuildContext context) {
  
   
    return Scaffold(
      backgroundColor: neutral5Color,
      appBar:  AppBar(
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
      body: HomePage(),
    
    );
  }


}
