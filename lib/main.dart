import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_task/Providers/db_provider.dart';
import 'package:project_task/Screens/Articles/articles_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DBProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYT Best Stories Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFe74c3c),
        appBarTheme: AppBarTheme(
          centerTitle: true, 
        ),
      ),
      home: ArticlesScreen(),
    );
  }
}
