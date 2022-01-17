import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:plant_app/providers/business_provider.dart';
import 'package:provider/provider.dart';

class AddReviewScreen extends StatefulWidget {
  final Business business;
  final User user;
  const AddReviewScreen({Key key, @required this.business, @required this.user})
      : super(key: key);

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  int rate = -1;

  TextEditingController _commentController = TextEditingController();

  Widget Star(int index) {
    return InkWell(
      onTap: () {
        this.setState(() {
          rate = index;
        });
      },
      child: Icon(
        Icons.star,
        color: rate < index ? Colors.grey.shade300 : Colors.yellow,
        size: 60,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Column(
          children: [
            Center(
              child: Text(
                'What is your rate?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++) Star(i),
                ],
              ),
            ),
            Center(
              child: Text(
                'Please share your comme about the place',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(8),
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _commentController,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    hintText: 'Write your comment',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Map<String, dynamic> requestJson = {
                    'rate': '${rate + 1}',
                    'comment': _commentController.text,
                    'user_id': '${widget.user.id}',
                    'business_id': '${widget.business.id}',
                  };
                  Provider.of<BusinessProvider>(context, listen: false)
                      .addReview(requestJson);
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Submit review',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
