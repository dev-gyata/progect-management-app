import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:progect_management_app/l10n/l10n.dart';
import 'package:progect_management_app/theme/theme.dart';
import 'package:progect_management_app/utils/navigation_utils.dart';
import 'package:progect_management_app/widgets/custom_textfield.dart';

class CreateNewProjectPage extends StatelessWidget {
  const CreateNewProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user =
        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(
            left: 20,
            top: 10,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: hintTextColor.withOpacity(.2),
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: context.goBack,
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ),
        title: Text(
          l10n.createANewProject,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: kToolbarHeight + 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label(context: context, text: l10n.projectTitle),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  hintText: l10n.addTheProjectTitle,
                  textInputType: TextInputType.text,
                  onValueChanged: (value) {
                    // context.read<CreateAccountCubit>().onFirstNameChanged =
                    // value;
                  }),
              const SizedBox(
                height: 20,
              ),
              label(context: context, text: l10n.description),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  maxLines: 4,
                  hintText: l10n.addDescription,
                  textInputType: TextInputType.text,
                  onValueChanged: (value) {
                    // context.read<CreateAccountCubit>().onFirstNameChanged =
                    // value;
                  }),
              const SizedBox(
                height: 20,
              ),
              label(context: context, text: l10n.category),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton.icon(
                        label: Text(l10n.team),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.groups_outlined,
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextButton.icon(
                        label: Text(l10n.personal),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            // iconColor: hintTextColor.withOpacity(.6),
                            foregroundColor: hintTextColor,
                            backgroundColor: kTextfieldBackgroundColor),
                        icon: const Icon(
                          Icons.person_3_outlined,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              label(context: context, text: l10n.addTeamMembers),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                runSpacing: 10,
                children: [
                  ...List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(user),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: kBlueColor,
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label(context: context, text: l10n.date),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton.icon(
                              label: const Text('dd/mm/yy'),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  // iconColor: hintTextColor.withOpacity(.6),
                                  foregroundColor: hintTextColor,
                                  backgroundColor: kTextfieldBackgroundColor),
                              icon: const Icon(
                                Icons.calendar_month,
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label(context: context, text: l10n.time),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton.icon(
                              label: const Text('hh:mm'),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  // iconColor: hintTextColor.withOpacity(.6),
                                  foregroundColor: hintTextColor,
                                  backgroundColor: kTextfieldBackgroundColor),
                              icon: const Icon(
                                Icons.access_time_sharp,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              label(context: context, text: l10n.addFile),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/doc.png',
                    height: 40,
                    width: 40,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/icons/jpg.png',
                    height: 40,
                    width: 40,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/icons/pdf.png',
                    height: 40,
                    width: 40,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: DottedBorder(
                        strokeCap: StrokeCap.round,
                        padding: const EdgeInsets.all(8),
                        dashPattern: const [6, 6],
                        radius: const Radius.circular(5),
                        borderType: BorderType.RRect,
                        color: hintTextColor,
                        child: const CircleAvatar(
                          radius: 10,
                          backgroundColor: hintTextColor,
                          child: Center(
                              child: Icon(
                            Icons.add,
                            color: kWhiteColor,
                            size: 10,
                          )),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: Text(l10n.createProject),
          ),
        ),
      ),
    );
  }
}

Widget label({required BuildContext context, required String text}) => Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    );
