import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/promotion_model.dart';
import 'package:plant_app/screens/promotion/promotion_screen.dart';

class PromotionsSlider extends StatelessWidget {
  final List<Promotion> promotions = [];

  final dynamic promotionsJson;
  PromotionsSlider({@required this.promotionsJson});

  void setEvents() {
    promotionsJson.forEach((i) {
      promotions.add(Promotion.fromJson(i));
    });
  }

  Widget buildPromotionsSlider() {
    Row promotionsSlider = Row(children: []);
    promotions.forEach((promotion) {
      promotionsSlider.children.add(
        PromotionCard(
          promotion: promotion,
        ),
      );
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: promotionsSlider,
    );
  }

  @override
  Widget build(BuildContext context) {
    setEvents();
    return buildPromotionsSlider();
  }
}

class PromotionCard extends StatelessWidget {
  final Promotion promotion;

  PromotionCard({
    this.promotion,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PromotionScreen(
              promotion: promotion,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding,
        ),
        width: size.width * 0.8,
        height: size.height * 0.25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 5,
              color: kPrimaryColor.withOpacity(0.23),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Container(
                width: size.width * 0.29,
                height: size.height * 0.25,
                color: Color(0xFFE7EBEE),
                child: Image.network(
                  '$api/image?path=${promotion.imgPath}',
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.image,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: size.width * 0.49,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: promotion.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: promotion.provider.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text:
                            'Untill ${DateFormat("dd MMM yyyy").format(promotion.endDate)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
