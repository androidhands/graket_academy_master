import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class Database {
  Database._internal() {
    getData();
  }
  static final Database _instance = Database._internal();
  factory Database() => _instance;

  getData() async {
    _ref = FirebaseDatabase.instance.ref();
    _snapshot = await _ref?.child('/').get();
    _ref?.onValue.listen((DatabaseEvent event) {
      data = event.snapshot;
      _allData = jsonDecode(jsonEncode(data.value));
      _allCourses = _allData!['courses'];
      _allUsers = _allData!['users'];
    });
  }

  setData(String path, Map<String, Object?> value) async {
    await _ref?.child(path).update(value);
  }

  bool isExist(String path) {
    return data.child(path).exists;
  }

  late DatabaseReference? _ref;
  late DatabaseEvent? _event;
  late DataSnapshot? _snapshot;
  late DataSnapshot data;
  Map<String, dynamic>? _allData = {};
  Map<String, dynamic>? _allCourses = {};
  Map<String, dynamic>? _allUsers = {};

  DatabaseReference? get ref => _ref;
  DatabaseEvent? get event => _event;
  DataSnapshot? get snapshot => _snapshot;
  Map<String, dynamic>? get allData => _allData;
  Map<String, dynamic>? get getAllCourses => _allCourses;
  Map<String, dynamic>? get getAllUsers => _allUsers;
}
