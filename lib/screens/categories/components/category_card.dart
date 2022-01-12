import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/custom/custom_cache_manager.dart';
import 'package:plant_app/models/category_model.dart';

import '../../../constants.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function press;

  CategoryCard({
    this.category,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                // color: product.color,
                color: Color(0xFFE7EBEE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: '${url}/${category.imgPath}',
                color: kPrimaryColor,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(color: kPrimaryColor)),
                errorWidget: (context, url, error) => Icon(Icons.error),
                cacheManager: CustomCacheManager.instance,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Text(
                category.name,
                style: TextStyle(color: kTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
