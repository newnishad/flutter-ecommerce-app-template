import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_template/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final ProductsController _productsController = Get.find();
  @override
  void initState() {
    super.initState();
    if (_productsController.products.isEmpty) {
      _productsController.loadProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.size.width * 0.04,
            vertical: Get.size.height * 0.03,
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(244, 245, 247, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search in Swipexyz",
              prefixIcon: SvgPicture.asset(
                "resources/search.svg",
                color: Colors.grey,
                fit: BoxFit.scaleDown,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        const Divider(),
        Obx(() => _productsController.isLoadingProducts.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: GridView.custom(
                  padding: EdgeInsets.all(Get.size.width * 0.03),
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 3,
                    mainAxisSpacing: Get.size.width * 0.02,
                    crossAxisSpacing: Get.size.width * 0.02,
                    repeatPattern: QuiltedGridRepeatPattern.same,
                    pattern: [
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      //
                      const QuiltedGridTile(2, 2),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      //
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: productPreview(index: index),
                      ),
                    ),
                    childCount: _productsController.products.length,
                  ),
                ),
              )),
      ],
    );
  }

  Widget productPreview({required int index}) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: _productsController.products[index].thumbnail,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
