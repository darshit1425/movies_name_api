import 'package:flutter/material.dart';
import 'package:movies_name_api/screen/movie_screen/provider/home_provider.dart';
import 'package:movies_name_api/screen/movie_screen/view/home_screen.dart';

import 'package:provider/provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Home_Provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Home_Screen(),
        },
      ),
    ),
  );
}