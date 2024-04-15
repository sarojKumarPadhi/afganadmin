import 'package:afganadmin/home/home.dart';
import 'package:afganadmin/screens/orders.dart';
import 'package:afganadmin/screens/payments.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        MyHomePage();
        break;
      case 1:
        const MyOrders();
        break;
      case 2:
        MyHomePage();
        break;
      case 3:
        const MyPayments();
        break;
      default:
        MyHomePage();
        break;
    }
  }
}
