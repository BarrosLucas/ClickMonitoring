import 'package:flutter/material.dart';

import 'login//Login.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Click Monitoring',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: const Color(0xFFF0F0EB),
        ),
        home: const Scaffold(
          body: Login(),
          backgroundColor: Color(0xFFF0F0EB),
        ),
        debugShowCheckedModeBanner: false,
      )
  );
}
