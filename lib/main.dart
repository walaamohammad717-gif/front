import 'package:app_11/editprofile.dart';
import 'package:app_11/homepage.dart';
import 'package:app_11/theme/theme.dart';
import 'package:app_11/theme/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(create: (context)=>Themeprovider(),
  child: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "editprofile": (context) => EditProfile(),
      },
      theme: Provider.of<Themeprovider>(context).themeData,
      darkTheme: darkMode,
      
    );
  }
}
