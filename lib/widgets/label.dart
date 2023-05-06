import 'package:flutter/material.dart';

Widget label({required BuildContext context, required String text}) => Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    );
