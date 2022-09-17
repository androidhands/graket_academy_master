import 'package:flutter/material.dart';
import 'package:graket_academy_master/app_pages/details_course_page.dart';
import 'package:graket_academy_master/core/firebase.dart';


class CustomSearchDelegate extends SearchDelegate {
  Database database = Database();

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    List courses = database.getAllCourses!.keys.toList();
    for (var course in courses) {
      if (database.getAllCourses![course]['name']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())) {
        matchQuery.add(course);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, i) {
        return ListTile(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailsCoursePage(id: matchQuery[i])));
          },
          title: Text(database.getAllCourses![matchQuery[i]]['name']),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    List courses = database.getAllCourses!.keys.toList();
    for (var course in courses) {
      if (database.getAllCourses![course]['name']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())) {
        matchQuery.add(course);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, i) {
        return ListTile(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailsCoursePage(id: matchQuery[i])));
          },
          title: Text(database.getAllCourses![matchQuery[i]]['name']),
        );
      },
    );
  }
}
