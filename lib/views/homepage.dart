import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:product/controllers/productcontroller.dart';
import 'package:product/views/productCard.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductCard(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }),
          )
        ],
      ),
    );
  }
}
