import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/custom/custom_cache_manager.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<Auth>(context, listen: true).user;

    return SizedBox(
      height: 130,
      width: 130,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Container(
            height: 130,
            width: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(65),
              // child: Image.asset(
              //   'assets/images/tarek.jpg',
              //   fit: BoxFit.fill,
              // ),
              child: user.avatarImgPath != null
                  ? CachedNetworkImage(
                      imageUrl: '${url}/${user.avatarImgPath}',
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  color: kPrimaryColor)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      cacheManager: CustomCacheManager.instance,
                    )
                  : Image.asset(
                      'assets/icons/avatar.png',
                      color: kPrimaryColor,
                      // fit: BoxFit.fill,
                    ),
            ),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(65),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
