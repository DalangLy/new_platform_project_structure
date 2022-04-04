import 'dart:io';
import 'package:flutter/material.dart';
import 'features/language/language_export.dart';

void main() {
  runApp(const MyApp());

  //(development only) to allow using localhost uri for api
  HttpOverrides.global = MyHttpOverrides();
}


//******************* Development Only **********************
class MyHttpOverrides extends HttpOverrides {
  //to allow using localhost uri for api (development only)
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LanguageWrapperPage(),
    );
  }
}