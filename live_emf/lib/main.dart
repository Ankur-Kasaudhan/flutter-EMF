// ignore_for_file: unnecessary_new

import 'package:live_emf/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/magnitudeProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MagnitudeProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
