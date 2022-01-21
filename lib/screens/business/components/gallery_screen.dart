import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/providers/business_provider.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  final int currentIndex;
  GalleryScreen({Key key, @required this.currentIndex}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int index = -1;
  @override
  void initState() {
    index = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List businessPhotos =
        Provider.of<BusinessProvider>(context, listen: true).business.photos;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('${index + 1} out of ${businessPhotos.length}'),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            // color: kPrimaryColor,
            size: 30.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
      ),
      body: PhotoViewGallery.builder(
        pageController: PageController(initialPage: widget.currentIndex),
        itemCount: businessPhotos.length,
        onPageChanged: (index) {
          this.setState(() {
            this.index = index;
          });
        },
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(
                '$api/image?path=${businessPhotos[index]}',
                headers: {'Connection': 'keep-alive'},
              ),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2);
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
        loadingBuilder: (context, imageChunkEvent) {
          return Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
