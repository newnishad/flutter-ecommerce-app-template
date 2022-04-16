import 'package:ecommerce_template/api/product_api.dart';
import 'package:ecommerce_template/models/product.dart';
import 'package:get/state_manager.dart';

class ProductsController extends GetxController {
  RxBool isLoadingProducts = false.obs;
  RxList<Product> products = RxList();

  Future<void> loadProducts() async {
    if (isLoadingProducts.isTrue) return;
    isLoadingProducts.value = true;
    refresh();
    products.addAll(await ProductApi().getProducts());
    isLoadingProducts.value = false;
    refresh();
  }

  reloadProducts() {
    products.clear();
    loadProducts();
  }
}
