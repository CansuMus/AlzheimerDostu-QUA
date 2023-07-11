import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../styles/colors/colors.dart';
import '../../Login/login_page.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({required this.user, Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Stream<DocumentSnapshot<Map<String, dynamic>>> _userDataStream;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() {
    _userDataStream = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.user.uid)
        .snapshots();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.mainThemeColor,
        title: const Text('Profilim'),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: _userDataStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Hata: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final userData = snapshot.data?.data();

          if (userData == null) {
            return Center(
              child: Text('Veri bulunamadı.'),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                //backgroundImage: NetworkImage(userData['profileImage']),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Ad Soyad',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  '${userData['name'] ?? ''}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.wc),
                title: Text(
                  'Cinsiyet',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  '${userData['gender'] ?? ''}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.wc),
                title: Text(
                  'Doğum Tarihi',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  '${userData['birthDate'] ?? ''}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  'E-posta',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  '${userData['email'] ?? ''}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  context.go(LoginPage.route);
                },
                child: const Text('Çıkış Yap'),
              ),
            ],
          );
        },
      ),
    );
  }
}
