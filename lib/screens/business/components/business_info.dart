import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/providers/business_provider.dart';
import 'package:plant_app/providers/businesses_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BusinessInfo extends StatefulWidget {
  final Business business;
  BusinessInfo({@required this.business});

  @override
  State<BusinessInfo> createState() => _BusinessInfoState();
}

class _BusinessInfoState extends State<BusinessInfo> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(
                    widget.business.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 90.sp,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<BusinessProvider>(context, listen: false)
                        .handleFavoriteIconButtonClick();

                    // Remove from wishlist screen, so it's not shown on come back
                    bool comingFromWishlistScreen =
                        Provider.of<BusinessesProvider>(context, listen: false)
                            .isWishlist;
                    if (comingFromWishlistScreen) {
                      Provider.of<BusinessesProvider>(context, listen: false)
                          .removeFromWishlistScreen(
                              businessId: widget.business.id);
                    }
                  },
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topCenter,
                  icon: widget.business.onUserWishlist
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 90.sp,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 90.sp,
                        ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: _buildRatingStars(widget.business.avgRate),
                ),
                widget.business.instagramLink != null
                    ? IconButton(
                        onPressed: () async {
                          print(widget.business.instagramLink);
                          await launch(widget.business.instagramLink);
                        },
                        icon: Image.asset('assets/icons/instagram.png'),
                        iconSize: 80.sp,
                      )
                    : Container(),
                widget.business.facebookLink != null
                    ? IconButton(
                        onPressed: () async {
                          print(widget.business.facebookLink);
                          await launch(widget.business.facebookLink);
                        },
                        padding: EdgeInsets.zero,
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                        iconSize: 120.sp,
                      )
                    : Container(),
              ],
            ),
            widget.business.description != null
                ? Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: ReadMoreText(
                      widget.business.description,
                      style: TextStyle(
                        fontSize: 55.sp,
                        color: Colors.black,
                      ),
                      trimLines: 3,
                      colorClickableText: kPrimaryColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(
                        fontSize: 55.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Container(),
            widget.business.websiteLink != null
                ? GestureDetector(
                    onTap: () async {
                      await launch(widget.business.websiteLink);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16.w),
                            child: Icon(
                              Icons.language,
                              color: kPrimaryColor,
                              size: 90.sp,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: Text(
                              widget.business.websiteLink,
                              style: TextStyle(
                                fontSize: 55.sp,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            GestureDetector(
              onTap: () {
                launch(widget.business.linkOnGoogleMaps);
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16.w),
                      child: Icon(
                        Icons.pin_drop,
                        color: kPrimaryColor,
                        size: 90.sp,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        widget.business.address,
                        style: TextStyle(
                          fontSize: 55.sp,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16.w),
                    child: Icon(
                      Icons.watch_later_outlined,
                      color: kPrimaryColor,
                      size: 90.sp,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Text(
                      widget.business.workingTime,
                      style: TextStyle(
                        fontSize: 55.sp,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16.w),
                    child: Icon(
                      Icons.phone,
                      color: kPrimaryColor,
                      size: 90.sp,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Text(
                      'Call us ${widget.business.phoneNo}',
                      style: TextStyle(
                        fontSize: 55.sp,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              height: 1050.h,
              child: WebView(
                navigationDelegate: (navigation) {
                  launch(widget.business.linkOnGoogleMaps);
                  return null;
                },
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: <JavascriptChannel>[
                  JavascriptChannel(
                      name: 'MessageInvoker',
                      onMessageReceived: (s) {
                        print(s.message);
                      }),
                ].toSet(),
                onWebViewCreated: (controller) {
                  _controller = controller;
                  loadLocalHtml(
                      iframeOnGoogleMaps: widget.business.iframeOnGoogleMaps);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadLocalHtml({@required String iframeOnGoogleMaps}) async {
    final url = Uri.dataFromString(
      iframeOnGoogleMaps,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();
    _controller.loadUrl(url);
  }

  Row _buildRatingStars(int rating) {
    List<Icon> ratingStars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating)
        ratingStars.add(Icon(Icons.star, color: Colors.yellow, size: 90.sp));
      else
        ratingStars
            .add(Icon(Icons.star, color: Colors.grey.shade300, size: 90.sp));
    }
    return Row(
      children: ratingStars,
    );
  }
}
