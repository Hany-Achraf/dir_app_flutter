import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessSliverAppBar extends StatelessWidget {
  final String _title;
  final _tabController;

  const BusinessSliverAppBar(
    this._title,
    this._tabController, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Container(
        margin: EdgeInsets.only(left: 20),
        child: Center(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: _title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                )),
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 25.0,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.more_vert,
          ),
          onPressed: () {},
        ),
      ],
      elevation: 0.0,
      backgroundColor: Colors.purple,
      expandedHeight: 280,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          Positioned.fill(
            child: Image.network(
                'https://savorsunsets.com/wp-content/uploads/2019/04/IMG_1891.jpg',
                fit: BoxFit.cover),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 150,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.purple.withOpacity(0.9),
                      Colors.transparent
                    ]))),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 150,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.purple.withOpacity(1.0),
                      Colors.transparent
                    ]))),
          ),
        ]),
      ),
    );
  }
}
