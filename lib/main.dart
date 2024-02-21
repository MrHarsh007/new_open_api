import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_open_api/HomePage.dart';
import 'package:new_open_api/petDetailsScreen.dart';
import 'package:openapi/petstore_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Open API Demo',
        petApi: PetApi(
            Dio(BaseOptions(baseUrl: "https://petstore.swagger.io/v2")),
            standardSerializers),
      ),
    );
  }
}
