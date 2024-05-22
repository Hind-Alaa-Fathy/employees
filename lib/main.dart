import 'package:employees/sql_helper.dart';
import 'package:flutter/material.dart';
import 'screens/form_page.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var db = SqlHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
      home: EmployeeFormPage()
    );
  }
}