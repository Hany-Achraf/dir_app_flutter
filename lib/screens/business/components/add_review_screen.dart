import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        size: 220.sp,
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
            size: 90.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'What is your rate?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 95.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++) Star(i),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 100.w, vertical: 24.h),
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
                        width: 10.sp,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.sp),
                    ),
                    hintText: 'Write your comment',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Map<String, dynamic> requestJson = {
                    'rate': '${rate + 1}',
                    'comment': _commentController.text,
                  };
                  Provider.of<BusinessProvider>(context, listen: false)
                      .addReview(requestJson);
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 75.w, vertical: 24.h),
                  height: 220.h,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      'Submit review',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
