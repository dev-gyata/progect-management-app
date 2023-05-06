import 'package:flutter/material.dart';
import 'package:progect_management_app/theme/theme.dart';
import 'package:progect_management_app/utils/navigation_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.hasBack = true,
      required this.title,
      this.trailingIconData,
      this.tailingTapped});
  final bool hasBack;
  final String title;
  final IconData? trailingIconData;
  final VoidCallback? tailingTapped;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: hintTextColor.withOpacity(.2),
            width: 1,
          ),
        ),
        child: Center(
          child: InkWell(
            onTap: context.goBack,
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ),
      ),
      title: Text(
        title,
      ),
      actions: [
        if (trailingIconData != null)
          Container(
            margin: const EdgeInsets.only(
              // left: 20,
              top: 15,
              right: 20,
              bottom: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: hintTextColor.withOpacity(.2),
              ),
            ),
            child: InkWell(
              onTap: tailingTapped,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(trailingIconData),
              ),
            ),
          ),
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
