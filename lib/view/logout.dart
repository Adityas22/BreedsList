import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugasakhir/model/user_model.dart';
import 'package:tugasakhir/view/login.dart';

String loginBox = 'loginBox';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Logout",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1B1A55),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Apakah Anda yakin ingin keluar?',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  ElevatedButton(
                    child: Text('Tidak'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: Text('Ya'),
                    onPressed: () {
                      _logout(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    print('Logout started');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');

    var box = Hive.box<LoginModel>(loginBox);
    await box.close();

    print('Navigating to LoginPage');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(loggedOut: true),
      ),
      (route) => false,
    );
  }
}
