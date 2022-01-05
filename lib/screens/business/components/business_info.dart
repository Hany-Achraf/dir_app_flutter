import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/providers/business_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BusinessInfo extends StatelessWidget {
  WebViewController controller;

  void loadLocalHtml({@required String locationOnMap}) async {
    // final String html =
    //     '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5975.931690340572!2d103.77683331960978!3d1.4973431654680631!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da6d76753d4f45%3A0xcce3bb22675ad2d6!2sRarry%20%26%20Branding%20Sdn.%20Bhd.!5e0!3m2!1sen!2smy!4v1638765801893!5m2!1sen!2smy" width="960" height="700" style="border:0;" allowfullscreen="" loading="lazy"></iframe>';

    final String html =
        '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.4493622302275!2d103.77518911439397!3d1.500958098905396!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da6ce180efcfb5%3A0x4cfa3e126a713ab5!2sThe%20Mall%2C%20Mid%20Valley%20Southkey!5e0!3m2!1sen!2smy!4v1640680339530!5m2!1sen!2smy" width="960" height="700" style="border:0;" allowfullscreen="" loading="lazy"></iframe>';

    final url = Uri.dataFromString(
      // html,
      locationOnMap,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();

    controller.loadUrl(url);
  }

  Row _buildRatingStars(int rating) {
    List<Icon> ratingStars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating)
        ratingStars.add(Icon(Icons.star, color: Colors.yellow));
      else
        ratingStars.add(Icon(Icons.star, color: Colors.grey.shade300));
    }
    return Row(
      children: ratingStars,
    );
  }

  @override
  Widget build(BuildContext context) {
    Business business =
        Provider.of<BusinessProvider>(context, listen: true).business;

    return Container(
      margin: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(
                    business.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<BusinessProvider>(context, listen: false)
                        .handleFavoriteIconButtonClick(userId: 1);
                  },
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topCenter,
                  icon: business.onUserWishlist
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 25,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 25,
                        ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: _buildRatingStars(business.avgRate),
                ),
                business.instagramLink != null
                    ? IconButton(
                        onPressed: () async {
                          await launch(business.instagramLink);
                        },
                        icon: Image.asset('assets/icons/instagram.png'),
                      )
                    : Container(),
                business.facebookLink != null
                    ? IconButton(
                        onPressed: () async {
                          await launch(business.facebookLink);
                        },
                        padding: EdgeInsets.zero,
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                          size: 35,
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            business.description != null
                ? SizedBox(
                    child: ReadMoreText(
                      business.description,
                      style: TextStyle(color: Colors.black),
                      trimLines: 3,
                      colorClickableText: kPrimaryColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 8,
            ),
            business.websiteLink != null
                ? InkWell(
                    onTap: () async {
                      await launch(business.websiteLink);
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 4),
                          child: Icon(
                            Icons.language,
                            color: kPrimaryColor,
                            size: 25,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: Text(
                            business.websiteLink,
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: _launchURL,
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 4),
                      child:
                          Icon(Icons.pin_drop, color: kPrimaryColor, size: 25)),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Text(
                      business.address,
                      // 'LG-018 (The Mall, Mid Valley Southkey) LG-018 (The Mall, Mid Valley Southkey), LG-018 (The Mall, Mid Valley Southkey)',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.watch_later_outlined,
                    color: kPrimaryColor,
                    size: 25,
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(
                    // 'Sun – Wed (10:00 – 22:00)',
                    business.workingTime,
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.phone,
                    color: kPrimaryColor,
                    size: 25,
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(
                    'Call us ${business.phoneNo}',
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.all(8),
              height: 280,
              child: WebView(
                navigationDelegate: (navigation) {
                  _launchURL();
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
                  this.controller = controller;
                  loadLocalHtml(locationOnMap: business.locationOnMap);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    if (!await launch('https://goo.gl/maps/BuaAqhUQkf37qkrb7'))
      throw 'Could not launch https://goo.gl/maps/BuaAqhUQkf37qkrb7';
  }
}
