import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future navigate({required Widget page}) async {
    if (Platform.isAndroid) {
      return Navigator.push(this, MaterialPageRoute(builder: (_) => page));
    } else {
      return Navigator.push(this, CupertinoPageRoute(builder: (_) => page));
    }
  }

  void goBack({dynamic result}) => Navigator.pop(this, result);
}
