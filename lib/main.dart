import 'package:flutter/material.dart';
import 'package:portfolio/views/main_dashboard.dart';

void main() {
 
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final PageStorageBucket bucket = PageStorageBucket();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MainDashBoard(),
      ),
    );
  }
}
