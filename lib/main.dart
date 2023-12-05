import 'pages/customer_fetch_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/personal_center.dart';
import 'pages/ordered_page.dart';
import 'pages/storage_page.dart';
import 'pages/delivery_page.dart';
import 'pages/settings_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaceXexpress demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
       '/main': (context) => MainPage(),
        '/personalCenter': (context) => PersonalCenterPage(),
        '/orderHistory': (context) => OrderHistoryPage(),
        '/storeMeal': (context) => StoragePage(),
        '/customerfetch':(context) => CustomerFetchPage(),
        '/delivery':(context) => DeliveryPage(),
        '/settings':(context) =>  SettingsPage(onModeChanged: (String ) {  },),
      },
    );
  }
}

