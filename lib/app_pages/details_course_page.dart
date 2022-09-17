import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_timeline/indicator_position.dart';
import 'package:flutter_timeline/flutter_timeline.dart';
import 'package:graket_academy_master/components/colors.dart';
import 'package:graket_academy_master/core/firebase.dart';
import 'package:graket_academy_master/elfarx/check_out.dart';

class DetailsCoursePage extends StatefulWidget {
  String id;
  DetailsCoursePage({Key? key, required this.id}) : super(key: key);
  @override
  State<DetailsCoursePage> createState() => _DetailsCoursePageState();
}

class _DetailsCoursePageState extends State<DetailsCoursePage> {
  TimelineEventDisplay plainEventDisplay(String title, String content) {
    return TimelineEventDisplay(
      child: TimelineEventCard(
        title: Text(title,
            style: const TextStyle(
                fontSize: 15,
                color: neutral1Color,
                fontWeight: FontWeight.w600)),
        content: Text(content,
            style: const TextStyle(fontSize: 13, color: neutral3Color)),
      ),
      indicator: const Icon(Icons.circle, color: neutral3Color),
      indicatorOffset: const Offset(-20, 0),
      anchor: IndicatorPosition.center,
    );
  }

  List<TimelineEventDisplay> events = [];

  void _addCourseContent(myCourse) {
    setState(() {
      events.clear();
      for (int i = 0; i < myCourse['chapters'].length; i++) {
        events.add(plainEventDisplay(myCourse['chapters'][i]['name'],
            myCourse['chapters'][i]['describe']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Database database = Database();
    var myCourse = database.getAllCourses?[widget.id];
    double rate = myCourse['rate'].toDouble();
    _addCourseContent(myCourse);

    return Scaffold(
      backgroundColor: neutral5Color,
      appBar: AppBar(
        backgroundColor: neutral5Color,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
            color: neutral1Color),
        title: const Text(
          'Details',
          style: TextStyle(
              fontSize: 20, color: neutral1Color, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 75),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                child: Container(
                  width: size.width,
                  color: neutral3Color,
                  child: Image.network(myCourse['img'], fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 80,
                          decoration: const BoxDecoration(
                            color: neutral1Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Center(
                              child: Text('Original',
                                  style: TextStyle(
                                      fontSize: 15, color: neutral5Color))),
                        ),
                        Row(
                          children: [
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              color: noneColor,
                              highlightColor: noneColor,
                              hoverColor: noneColor,
                              focusColor: noneColor,
                              splashColor: noneColor,
                              disabledColor: noneColor,
                              onPressed: () {
                                setState(() {});
                              },
                              icon: const Icon(Icons.favorite_border,
                                  color: neutral1Color),
                            ),
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              color: noneColor,
                              highlightColor: noneColor,
                              hoverColor: noneColor,
                              focusColor: noneColor,
                              splashColor: noneColor,
                              disabledColor: noneColor,
                              onPressed: () {
                                setState(() {});
                              },
                              icon: const Icon(Icons.bookmark_outline,
                                  color: neutral1Color),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(myCourse['name'],
                        style: const TextStyle(
                            fontSize: 25,
                            color: neutral1Color,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    Text(myCourse['instructor'],
                        style: const TextStyle(
                            fontSize: 15, color: neutral3Color)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBarIndicator(
                          rating: rate / 1.0,
                          itemBuilder: (context, index) =>
                              const Icon(Icons.star, color: ascentColor),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                        Text('$rate/5',
                            style: const TextStyle(
                                fontSize: 16,
                                color: neutral1Color,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text('About This Class',
                        style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    Text(myCourse['about'],
                        style: const TextStyle(
                            fontSize: 15, color: neutral3Color)),
                    const SizedBox(height: 30),
                    const Text('Schedule',
                        style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ImageIcon(AssetImage('assets/icons/schedule.png'),
                            color: neutral3Color),
                        const SizedBox(width: 5),
                        Text(myCourse['schedule'],
                            style: const TextStyle(
                                fontSize: 15, color: neutral3Color)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Skills',
                      style: TextStyle(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: myCourse['skills'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                              color: neutral1Color,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                myCourse['skills'][index],
                                style: const TextStyle(
                                    fontSize: 15, color: neutral5Color),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text('Instructors',
                        style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: myCourse['creator'].length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          margin: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            onTap: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            leading: const CircleAvatar(
                              backgroundColor: neutral2Color,
                            ),
                            title: Text(myCourse['creator'][index]['name'],
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: neutral1Color,
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(myCourse['creator'][index]['about'],
                                style: const TextStyle(
                                    fontSize: 15, color: neutral2Color)),
                            trailing: const ImageIcon(
                                AssetImage('assets/icons/right.png'),
                                color: neutral2Color),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    const Text('In this course',
                        style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    TimelineTheme(
                      data: TimelineThemeData(
                        lineColor: neutral3Color,
                        gutterSpacing: 10,
                        itemGap: 10,
                        lineGap: 0,
                        strokeWidth: 2.5,
                      ),
                      child: Timeline(
                        padding: const EdgeInsets.all(0),
                        anchor: IndicatorPosition.center,
                        altOffset: const Offset(20, -20),
                        indicatorSize: 25,
                        events: events,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: primaryColor),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckOut(id: widget.id)));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: size.width - 40,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Enroll',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${myCourse['mainprice']}\$',
                              style: const TextStyle(
                                color: neutral4Color,
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: ' ${myCourse['price']}\$',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
