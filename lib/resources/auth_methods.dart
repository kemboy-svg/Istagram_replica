import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_app/resources/storage_methods.dart';
import 'package:instagram_app/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fire = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'An error occured';
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('ProfilePics', file, false);

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          bio: bio,
          email: email,
          followers: [],
          following: [],
          photoUrl: photoUrl,
         
        );

        await _fire.collection('users').doc(cred.user!.uid).set(user.toJson(),);
        // await _fire.collection('users').add({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'bio': bio,
        //   'email': email,
        //   'Followers': [],
        //   'Following': [],
        // });
        res = " Signed up success";
      } else {
        // ignore: non_constant_identifier_names, unused_element
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "login success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // ignore: non_constant_identifier_names
}


