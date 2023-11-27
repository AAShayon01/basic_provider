import 'package:exercise/providers/data_model_provider.dart';
import 'package:exercise/providers/webSeriesProvider.dart';
import 'package:exercise/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers:[
           ChangeNotifierProvider<WebSeriesProvider>(create: (_)=>WebSeriesProvider()),
           ChangeNotifierProvider<DataModelProvider>(create:(_)=>DataModelProvider()),
      ],
              child: MyApp(),
      ),

  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
    );
  }
}
