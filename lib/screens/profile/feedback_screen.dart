import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController _feedbackTextController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _selectedFeedbackType;
  bool _showNote = false;

  Widget FeedbackOption(value, title) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _selectedFeedbackType,
          activeColor: kPrimaryColor,
          onChanged: (value) {
            setState(() {
              _selectedFeedbackType = value;
              _showNote =
                  (value == 'issue' || value == 'suggestion') ? true : false;
            });
          },
        ),
        Text(title),
      ],
    );
  }

  Widget EnterTextualFeedbackNote() {
    return Container(
      width: 350,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        border: Border.all(
          color: kPrimaryColor,
          // color: Colors.purple.shade300,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.green.shade900,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Note: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'You must enter a textual feedback if your feedback is "Report an issue" or "Suggestion" ',
            ),
            TextSpan(
              text: '*',
              style: TextStyle(color: Colors.red.shade900),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Feedback',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 1.5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please specify the type of your feedback',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                FeedbackOption('issue', 'Report an Issue'),
                FeedbackOption('suggestion', 'Suggestion'),
                FeedbackOption('like', 'Like'),
                FeedbackOption('dislike', 'Dislike'),
                _showNote ? EnterTextualFeedbackNote() : Container(),
                Container(
                  width: 350,
                  margin: EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: _feedbackTextController,
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Enter your feedback',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (_selectedFeedbackType == null ||
                        _showNote && _feedbackTextController.text.isEmpty) {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Invalid input',
                              style: TextStyle(color: kTextColor),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'Dismiss',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            content: Text(
                              'Enter your feedback, please!',
                              style: TextStyle(color: kTextColor),
                            ),
                          );
                        },
                      );
                    } else {
                      Flushbar(
                        message: 'Feedback has been submitted successfully!',
                        duration: Duration(seconds: 2),
                      ).show(context).then((_) {
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 12),
                    padding: EdgeInsets.all(8),
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 5,
                          color: kPrimaryColor.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Submit feedback',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
