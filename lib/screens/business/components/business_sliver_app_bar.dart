import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/constants.dart';

class BusinessSliverAppBar extends StatelessWidget {
  final String name;
  final String coverImgPath;

  const BusinessSliverAppBar({
    this.name,
    this.coverImgPath,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 90.sp,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0.0,
      expandedHeight: 0.5.sh,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          Positioned.fill(
            child: Image.network(
              '$api/image?path=$coverImgPath',
              headers: {'Connection': 'keep-alive'},
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.image,
                color: Colors.grey,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
