import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/screens/business/business_screen.dart';

class BusinessSearchCard extends StatelessWidget {
  final Business business;
  BusinessSearchCard({this.business});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BusinessScreen(businessId: business.id),
          ),
        );
      },
      child: Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
        child: ListTile(
          leading: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                '${api}/image?path=${business.iconImgPath}',
                headers: {'Connection': 'keep-alive'},
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            text: TextSpan(
              text: business.name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
