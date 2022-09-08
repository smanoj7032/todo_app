import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/src/ui/home/home.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'To Do',
      debugShowCheckedModeBanner: false,
    );
  }
}

