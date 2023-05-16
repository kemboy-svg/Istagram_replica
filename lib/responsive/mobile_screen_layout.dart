import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/providers/user_providers.dart';
import 'package:provider/provider.dart';
import 'package:instagram_app/models/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayout();
}

class _MobileScreenLayout extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
   model.User user = Provider.of<UserProvider>(context).getUser;
    return const Scaffold(
        body: Center(
      child: Text (user.username),
    ),
    );
  }
}
