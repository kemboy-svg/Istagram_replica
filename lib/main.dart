import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/responsive/mobile_screen_layout.dart';
import 'package:instagram_app/responsive/responsive_layout.dart';
import 'package:instagram_app/responsive/web_Screen_layout.dart';
import 'package:instagram_app/screens/login_screen.dart';
import 'package:instagram_app/screens/sign_up_screen.dart';
import 'package:instagram_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options:  const FirebaseOptions(
        apiKey: 'AIzaSyBFrW8k6t2KnFR6_QFEapUcWNsARHoRWUo',
        appId: '1:439362161469:web:2044c00eef3695f014d354',
        messagingSenderId: '439362161469',
        projectId: 'instagram-replica-19673',
        storageBucket: 'instagram-replica-19673.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram IG',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   webScreenLayout: WebScreenLayout(),
      //   mobileScreenLayout: MobileScreenLayout(),
      // ),
      home:const LoginScreen(),
    );
  }
} 
