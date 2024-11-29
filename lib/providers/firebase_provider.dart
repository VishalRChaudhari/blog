import 'package:flutter/material.dart';
import 'package:zarity_project/models/blog.dart';
import 'package:zarity_project/services/firebase_services.dart';

class FirebaseProvider extends ChangeNotifier {
  final FirebaseServices firebaseServices = FirebaseServices();

  var _isLoading = false;
  String? _errorMessage;
  List<Blog> _data = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<Blog> get data => _data;

  Future<void> fetchData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await firebaseServices.fetchdata();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
