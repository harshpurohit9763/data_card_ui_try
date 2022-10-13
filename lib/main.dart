import 'package:flutter/material.dart';
import 'package:one_data_card/screens/home_screen.dart';
import 'package:one_data_card/screens/signup_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/login_screen.dart';
import 'utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAAtBIEb2sHD2ogUmtVjq9bNU82ej8l2Sw",
          authDomain: "one-person-one-data-card.firebaseapp.com",
          projectId: "one-person-one-data-card",
          storageBucket: "one-person-one-data-card.appspot.com",
          messagingSenderId: "810089656305",
          appId: "1:810089656305:web:b98fc0a3f17e414a639e50"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
