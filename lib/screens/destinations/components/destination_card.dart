import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:plant_app/screens/destination/destination_screen.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({this.destination});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationScreen(destination: destination),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.2,
            width: size.width * 0.4,
            decoration: BoxDecoration(
              color: Color(0xFFE7EBEE),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                '${api}/image?path=${destination.imgPath}',
                headers: {'Connection': 'keep-alive'},
                fit: BoxFit.cover,
                errorBuilder: (context, url, error) => Icon(
                  Icons.image,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          Container(
            width: size.width * 0.4,
            padding: EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 5,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: TextSpan(
                        text: "${destination.name}\n".toUpperCase(),
                        style: Theme.of(context).textTheme.button),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
