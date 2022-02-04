import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/screens/business/components/gallery_screen.dart';

class BusinessPhotos extends StatelessWidget {
  final Business business;
  const BusinessPhotos({Key key, @required this.business}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> photos = business.photos;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GalleryScreen(currentIndex: index)),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE7EBEE),
                      image: DecorationImage(
                        image: NetworkImage(
                          '$api/image?path=${photos[index]}',
                          headers: {'Connection': 'keep-alive'},
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
