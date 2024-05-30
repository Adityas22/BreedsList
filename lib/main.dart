import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/date_symbol_data_local.dart';
import 'package:tugasakhir/model/user_model.dart';
import 'package:tugasakhir/view/login.dart';
import 'package:tugasakhir/view/home.dart';

String loginBox = 'loginBox';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeTimeZones();
  await initializeDateFormatting();

  await Hive.initFlutter();
  Hive.registerAdapter<LoginModel>(LoginModelAdapter());
  await Hive.openBox<LoginModel>(loginBox);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<void> initializeTimeZones() async {
  tzdata.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? HomePage() : const LoginPage(),
    );
  }
}
