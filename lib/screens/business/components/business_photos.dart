import 'package:flutter/material.dart';
import 'package:plant_app/screens/business/components/gallery_screen.dart';
import 'package:tuple/tuple.dart';

class BusinessPhotos extends StatelessWidget {
  const BusinessPhotos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GalleryScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/paris.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              itemCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
