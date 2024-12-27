import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sky_station/repository/iss_dio_api_repository.dart';
import 'package:sky_station/repository/iss_repository.dart';
import 'package:sky_station/view/login_screen.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  servicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISS Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}

void servicesLocator() {
  getIt.registerLazySingleton<IssRepository>(() => IssDioApiRepository());
}
