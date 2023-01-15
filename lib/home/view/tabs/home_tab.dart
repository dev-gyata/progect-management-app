import 'package:flutter/material.dart';
import 'package:progect_management_app/l10n/l10n.dart';
import 'package:progect_management_app/theme/theme.dart';
import 'package:progect_management_app/widgets/custom_textfield.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final top = MediaQuery.of(context).viewPadding.top;
    final devSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
            top: top + 20,
            left: devSize.width * .05,
            right: devSize.width * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.welcomeBack,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 12, color: hintTextColor),
                    ),
                    Text(
                      'Asamoah Yeboah',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 14),
                    )
                  ],
                ),
                const Spacer(),
                InkWell(
                    onTap: () {},
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: hintTextColor.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(Icons.notifications),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomTextfield(
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.search,
                      color: hintTextColor.withOpacity(.6),
                    ),
                  ),
                  hintText: l10n.searchForTask,
                  textInputType: TextInputType.text,
                  onValueChanged: (value) {}),
            ),
            Text(
              l10n.myProjects,
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        ),
      )),
    );
  }
}
