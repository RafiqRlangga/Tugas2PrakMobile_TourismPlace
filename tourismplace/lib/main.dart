import 'package:flutter/material.dart';
import 'package:wisata/menu_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Wisata',
      debugShowCheckedModeBanner: false,
      home: MenuList(),
    );
  }
}