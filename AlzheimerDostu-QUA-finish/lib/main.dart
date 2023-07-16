import 'package:ff_55/routes/app_routes.dart';
import 'package:ff_55/shared.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'features/patient/patient_contact/Model/contact_model.dart';
import 'firebase_options.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ContactAdapter());
  final contactBox = await Hive.openBox("contacts");

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await MySharedPrefference.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,

    );
  }
}