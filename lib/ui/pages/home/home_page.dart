import 'package:flutter/material.dart';
import 'package:f_authentication_template/domain/controllers/authentication_controller.dart';
import 'package:f_authentication_template/data/repositories/local_preferences.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthenticationController controller = Get.find<AuthenticationController>();

  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Welcome")),
    );
  }
}
