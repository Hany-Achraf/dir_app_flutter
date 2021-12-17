import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:plant_app/constants.dart';
import 'package:readmore/readmore.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BusinessInfo extends StatelessWidget {
  static const List<Tuple2> tutorials = [
    const Tuple2<String, String>(
      'http://himdeve.com/wp-content/uploads/2020/01/1_1_simple_webview_en_banner.jpg',
      'Flutter Tutorials – #1.1 – First App – Simple WebView',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/01/1_2_webview_controller_en_banner.jpg',
      'Flutter Tutorials – #1.2 – WebView Controller – Completer, Future Builder, Await – Async',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/01/1_3_webview_javascript_en_banner.jpg',
      'Flutter Tutorial – #1.3 – WebView – Navigation Controls, Javascript communication',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/01/1_4_drawer_en_banner_final.jpg',
      'Flutter Tutorials – #1.4 – DRAWER – PageRoute, Navigator, UserAccountsDrawerHeader',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/02/1_5_sliverappbar_banner_en.jpg',
      'Flutter Tutorials – #1.5 – Sliver App Bar = Collapsing Toolbar',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/02/1_6_sliverlist_banner_en.jpg',
      'Flutter Tutorials – #1.6 – SliverList',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/02/1_7_pageview_banner_en_final.jpg',
      'Flutter Tutorials – #1.7 – PageView & BottomNavigationBar',
    ),
    const Tuple2<String, String>(
      'https://himdeve.com/wp-content/uploads/2020/02/1_8_tabbar_banner_en.jpg',
      'Flutter Tutorials – #1.8 – TabBar',
    ),
  ];

  WebViewController controller;

  void loadLocalHtml() async {
    final String html =
        '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5975.931690340572!2d103.77683331960978!3d1.4973431654680631!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da6d76753d4f45%3A0xcce3bb22675ad2d6!2sRarry%20%26%20Branding%20Sdn.%20Bhd.!5e0!3m2!1sen!2smy!4v1638765801893!5m2!1sen!2smy" width="960" height="700" style="border:0;" allowfullscreen="" loading="lazy"></iframe>';
    final url = Uri.dataFromString(
      html,
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
                      'Lorem ipsum dolor sit amet, ptate velit esse cillum dolore eu fugiat nulla pariatur.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topRight,
                    icon: Icon(Icons.favorite_border,
                        color: Colors.grey, size: 25)),
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
                  child: _buildRatingStars(4),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/instagram.png'),
                ),
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 300,
              child: ReadMoreText(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(color: Colors.black),
                trimLines: 3,
                colorClickableText: kPrimaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
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
                    'http://www.al-ikhsan.com',
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
            InkWell(
              onTap: _launchURL,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 4),
                      child:
                          Icon(Icons.pin_drop, color: kPrimaryColor, size: 25)),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Text(
                      'LG-018 (The Mall, Mid Valley Southkey) LG-018 (The Mall, Mid Valley Southkey), LG-018 (The Mall, Mid Valley Southkey)',
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
                    'Sun – Wed (10:00 – 22:00)',
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
                    'Call us 019-7066523',
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
              height: 700,
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
                  loadLocalHtml();
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
