import 'package:auto_route/auto_route.dart';
import 'package:base_code/core/injection/injection.dart';
import 'package:base_code/core/routes/router.gr.dart';
import 'package:flutter/material.dart';

void main() {
  configureInjection();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aire control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: ExtendedNavigator<Router>(router: Router()),
    );
  }
}
