import 'package:flutter/material.dart';
import 'package:progect_management_app/theme/theme.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.hintText,
      required this.textInputType,
      required this.onValueChanged,
      this.isPassword = false});
  final String hintText;
  final TextInputType? textInputType;
  final void Function(String value) onValueChanged;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kTextfieldBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: textInputType,
                onChanged: onValueChanged,
                decoration: InputDecoration.collapsed(
                    hintText: hintText,
                    hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: hintTextColor.withOpacity(.6), fontSize: 14)),
              ),
            ),
            if (isPassword)
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.visibility_outlined,
                    color: Colors.black54,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
