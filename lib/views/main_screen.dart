import 'package:ecommerce_template/controllers/products_controller.dart';
import 'package:ecommerce_template/controllers/tab_controller.dart';
import 'package:ecommerce_template/views/custom_bottom_navigation.dart';
import 'package:ecommerce_template/views/tabs/home_tab.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  // ignore: unused_field
  final ProductsController _productsController = Get.put(ProductsController());
  // ignore: unused_field
  final MainScreenController _mainScreenController =
      Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  _mainScreenController.currentTab.value = index;
                },
                children: const [
                  HomeTab(),
                  HomeTab(), // Dummy UI for Explore Tab
                  HomeTab(), // Dummy UI for Inbox
                  HomeTab(), // Dummy UI for Shop
                ],
              ),
            ),
            CustomBottomNavigation(
              onSelectTab: (int index) {
                _mainScreenController.currentTab.value = index;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
