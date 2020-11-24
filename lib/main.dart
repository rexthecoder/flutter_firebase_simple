import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/ui/sign_up_with_email.dart';

void main() async{
 
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(Application());
}

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignupWithEmailAndPassowd(),
    );
  }
}

