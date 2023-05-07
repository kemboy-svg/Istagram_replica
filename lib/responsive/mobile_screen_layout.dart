import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayout();
}

class _MobileScreenLayout extends State<MobileScreenLayout> {



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:
      Text('This is your mobile')
      ,) 
    );
  }
}