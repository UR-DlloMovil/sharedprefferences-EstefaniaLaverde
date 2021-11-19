import 'package:f_authentication_template/domain/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/my_app.dart';

void main() {
  Get.put(AuthenticationController());
  runApp(MyApp());
}
