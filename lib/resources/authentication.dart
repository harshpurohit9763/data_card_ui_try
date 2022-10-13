import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:one_data_card/resources/storage.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String firstName,
    required String middleName,
    required String lastName,
    required String phoneNumber,
    required Uint8List file,
  }) async {
    String res = 'An Error Has Occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          firstName.isNotEmpty ||
          middleName.isNotEmpty ||
          lastName.isNotEmpty ||
          phoneNumber.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        StorageMethod().uploadImageToStorage('ProfilePics', file, false);

        await _firestore.collection('Users').doc(cred.user!.uid).set({
          'email': email,
          'uid': cred.user!.uid,
          'phone-number': phoneNumber,
          'full-name': firstName + ' ' + middleName + ' ' + lastName,
        });
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
