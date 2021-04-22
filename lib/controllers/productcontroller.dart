import 'package:get/state_manager.dart';
import 'package:product/models/apimodel.dart';
import 'package:product/services/remote_services.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Welcome>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
