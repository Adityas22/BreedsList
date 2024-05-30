import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF1B1A55),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage('assets/aditya.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Aditya Septiawan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'NIM: 123210014',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            const Text(
              'Kelas: TPM IF-E',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            const Text(
              'Prodi: Informatika',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
