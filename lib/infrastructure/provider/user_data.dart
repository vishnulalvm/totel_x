import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:totel_x/domain/models/user_model/user.dart';


class UserProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    try {
      final docRef = await _firestore.collection('users').add(user.toMap());
      user.id = docRef.id;
      notifyListeners();
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  // Add other methods for retrieving, updating, or deleting users as needed
}