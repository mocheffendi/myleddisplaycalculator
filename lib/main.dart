import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myleddisplaycalculator/firebase_options.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:myleddisplaycalculator/views/homepage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: 'mynotes',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      //   useMaterial3: true,
      // ),
      home: const SafeArea(child: HomeScreen()),
    );
  }
}
