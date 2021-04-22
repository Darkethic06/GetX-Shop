import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/models/apimodel.dart';

class ProductCard extends StatelessWidget {
  final Welcome welcome;
  const ProductCard(this.welcome);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(
                    welcome.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(() => CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: welcome.isFavorite.value
                              ? Icon(Icons.favorite_rounded)
                              : Icon(Icons.favorite_border),
                          onPressed: () {
                            welcome.isFavorite.toggle();
                          },
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              welcome.name,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8,
            ),
            if (welcome.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(13),
                ),
                padding:EdgeInsets.symmetric(horizontal: 4,
                vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Text(
                "${welcome.price}",
                style: TextStyle(
                  fontSize: 25
                ),
              )
          ],
        ),
      ),
    );
  }
}
