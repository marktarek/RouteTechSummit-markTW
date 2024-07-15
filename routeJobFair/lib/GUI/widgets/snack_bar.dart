// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

showSnackBar(
    {required BuildContext context,
    required String msg,
    required backgroundColor,
    apiType}) {

  final SnackBar snackBar = SnackBar(
    content: Text(
      msg,
    ),
    backgroundColor: backgroundColor,
  );

  if (kIsWeb && msg == networkMsg) {
    ///
  } else if (msg.contains('400') ||
      msg.contains('404') ||
      msg.contains('The connection was not closed.') ||
      msg.contains('A second operation started on this context') ||
      msg.contains('OutOfMemoryException') ||
      msg.contains("ExecuteReader") ||
      msg.contains("No Current Contract is Found For this User")) {
    if (kDebugMode) {
      try {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } catch (error) {
        print(error);
      }
    } else {
      if (apiType == 'Post') {
        showSnackBar(
          context: context,
          msg: 'Please, Try Again',
          backgroundColor: backgroundColor,
          apiType: 'Post',
        );
      } else {
        if (!msg.contains("No Current Contract is Found For this User")) {
          showSnackBar(
            context: context,
            msg: 'Please, Wait.....',
            backgroundColor: backgroundColor,
            apiType: 'Get',
          );
        }
      }
    }
  } else {
    try {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (error) {
      print(error);
    }
  }
}

class SnackBarMsgType {
  Color successMsg = const Color(0xff3acc44);
  Color errorMsg = const Color(0xff197093);
  Color warningMsg = const Color(0xffff0000);
}

const String networkMsg = "Please check Your Internet Connection";
const int apiRecallDuration = 10;
