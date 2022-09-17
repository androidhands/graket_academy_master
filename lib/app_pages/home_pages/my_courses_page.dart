import 'package:flutter/material.dart';
import 'package:graket_academy_master/app_pages/preview_course_page.dart';
import 'package:graket_academy_master/authentication.dart';
import 'package:graket_academy_master/components/colors.dart';
import 'package:graket_academy_master/core/firebase.dart';


class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String uid = EmailAuthentication().user?.uid;
    Database database = Database();
    Map<String, dynamic>? courses = database.getAllCourses;
    List myCourses = [];
    if (database.isExist('users/$uid/courses')) {
      myCourses = database.getAllUsers?[uid]['courses'].keys.toList();
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: myCourses.length,
              itemBuilder: (context, index) {
                var course = courses![myCourses[index]];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PreviewCoursePage(id: myCourses[index]),
                        ),);
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: 120,
                      width: double.infinity - 20,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                course['img'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: Text(
                                  course['name'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: neutral1Color,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(Icons.timer_outlined, size: 25),
                                  Text(
                                    database.isExist(
                                            'courses/${myCourses[index]}/minutes')
                                        ? ' ${course['hours']} hr ${course['minutes']} min'
                                        : ' ${course['hours']} hr 0 min',
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
