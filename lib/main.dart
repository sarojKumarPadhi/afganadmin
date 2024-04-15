import 'package:afganadmin/auth/emailpage.dart';
import 'package:afganadmin/firebase_options.dart';
import 'package:afganadmin/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  //open the box
  await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var box = Hive.box('mybox');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var isLoggedIn = box.get('isLoggedIn', defaultValue: false);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIn == true ? MyHomePage() : EmailPage(),
    );
  }
}
