import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graket_academy_master/app_pages/details_course_page.dart';
import 'package:graket_academy_master/components/colors.dart';
import 'package:graket_academy_master/core/firebase.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  List courses = [];
  Database database = Database();

  List simpleInterests = ['Art', 'UI/UX', 'Development', 'Sciences'];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (_) => verify());
  }

  verify() {
    if (courses.isEmpty) {
      setState(() {});
    } else {
      timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    courses = database.getAllCourses!.keys.toList();

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
        setState(() {});
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('For You',
                      style: TextStyle(
                          fontSize: 20,
                          color: neutral1Color,
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    splashColor: noneColor,
                    focusColor: noneColor,
                    hoverColor: noneColor,
                    highlightColor: noneColor,
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                    },
                    child: const Text("View All > ",
                        style: TextStyle(fontSize: 15, color: ascentColor)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: neutral5Color,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Card(
                                      color: neutral2Color,
                                      child: SizedBox(
                                        height: 45,
                                        width: 45,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(simpleInterests[0],
                                            style: const TextStyle(
                                                color: neutral1Color,
                                                fontSize: 14)),
                                        const Text('2000+ Class',
                                            style: TextStyle(
                                                color: neutral2Color,
                                                fontSize: 11))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: neutral5Color,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Card(
                                      color: neutral2Color,
                                      child: SizedBox(
                                        height: 45,
                                        width: 45,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(simpleInterests[1],
                                            style: const TextStyle(
                                                color: neutral1Color,
                                                fontSize: 14)),
                                        const Text('2000+ Class',
                                            style: TextStyle(
                                                color: neutral2Color,
                                                fontSize: 11))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: neutral5Color,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Card(
                                      color: neutral2Color,
                                      child: SizedBox(
                                        height: 45,
                                        width: 45,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(simpleInterests[2],
                                            style: const TextStyle(
                                                color: neutral1Color,
                                                fontSize: 14)),
                                        const Text('2000+ Class',
                                            style: TextStyle(
                                                color: neutral2Color,
                                                fontSize: 11))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: neutral5Color,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Card(
                                      color: neutral2Color,
                                      child: SizedBox(
                                        height: 45,
                                        width: 45,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(simpleInterests[3],
                                            style: const TextStyle(
                                                color: neutral1Color,
                                                fontSize: 14)),
                                        const Text('2000+ Class',
                                            style: TextStyle(
                                                color: neutral2Color,
                                                fontSize: 11))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular',
                      style: TextStyle(
                          fontSize: 20,
                          color: neutral1Color,
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    splashColor: noneColor,
                    focusColor: noneColor,
                    hoverColor: noneColor,
                    highlightColor: noneColor,
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                    },
                    child: const Text("View All > ",
                        style: TextStyle(fontSize: 15, color: ascentColor)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 275,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length > 10 ? 10 : courses.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final myCourse = database.getAllCourses![courses[index]];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsCoursePage(id: courses[index]),
                            ));
                      },
                      child: Card(
                        color: neutral5Color,
                        shadowColor: neutral3Color,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: SizedBox(
                                  height: 140,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      myCourse['img'],
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Container(
                                          color: neutral1Color,
                                          width: 200,
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    myCourse['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    myCourse['instructor'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: neutral2Color,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.person_outline,
                                        size: 25,
                                        color: neutral2Color,
                                      ),
                                      Text(' ${myCourse['students']} students',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: neutral2Color,
                                          )),
                                      const SizedBox(width: 20),
                                      const Icon(
                                        Icons.timer_outlined,
                                        size: 25,
                                        color: neutral2Color,
                                      ),
                                      Text(
                                        database.isExist(
                                                'courses/${courses[index]}/minutes')
                                            ? ' ${myCourse['hours']} hr ${myCourse['minutes']} min'
                                            : ' ${myCourse['hours']} hr 0 min',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: neutral2Color,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // RichText(
                                  //   textAlign: TextAlign.end,
                                  //   text: TextSpan(
                                  //     children: [
                                  //       TextSpan(
                                  //         text: '${myCourse['mainprice']}\$',
                                  //         style: const TextStyle(
                                  //           fontSize: 14,
                                  //           color: neutral1Color,
                                  //           decoration:
                                  //               TextDecoration.lineThrough,
                                  //         ),
                                  //       ),
                                  //       TextSpan(
                                  //         text: ' ${myCourse['price']}\$',
                                  //         style: const TextStyle(
                                  //             color: neutral1Color,
                                  //             fontSize: 15,
                                  //             fontWeight: FontWeight.bold),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
