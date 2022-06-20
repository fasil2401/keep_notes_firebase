import 'package:get/get.dart';

class EmailController extends GetxController {
  final email = ''.obs;

  uppdateEmail(String email) {
    this.email.value = email;
  }
  
}