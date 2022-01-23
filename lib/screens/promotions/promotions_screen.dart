import 'package:flutter/material.dart';
import 'package:plant_app/screens/promotions/components/body.dart';

class PromotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.maybeOf(context).pop();
            }),
      ),
      body: Body(),
    );
  }
}
