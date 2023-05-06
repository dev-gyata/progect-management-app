import 'package:flutter/material.dart';
import 'package:progect_management_app/home/view/tabs/todays_task_section.dart';
import 'package:progect_management_app/l10n/l10n.dart';
import 'package:progect_management_app/theme/theme.dart';
import 'package:progect_management_app/widgets/custom_app_bar.dart';
import 'package:progect_management_app/widgets/label.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const src =
        'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';

    return Scaffold(
      appBar: CustomAppBar(
          tailingTapped: () {},
          trailingIconData: Icons.more_horiz,
          title: l10n.projectDetails),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(src))),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Fintech app Design - ios and Android',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18, color: kBlackColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.calendar_month_rounded,
                    color: kBlueColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Due 03 April 2023',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 15,
                    foregroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
                  ),
                  Positioned(
                      left: 25,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80')),
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                            color: Colors.red),
                      )),
                  Positioned(
                    left: 50,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')),
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                          color: Colors.green),
                    ),
                  ),
                  Positioned(
                    left: 75,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')),
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                          color: Colors.green),
                    ),
                  ),
                  Positioned(
                      left: 100,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: kBlueColor,
                        child: Center(
                            child: Text(
                          '+3',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: kWhiteColor, fontSize: 10),
                        )),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              label(context: context, text: l10n.description),
              const SizedBox(
                height: 10,
              ),
              Text(
                'This project is a finetech app that will also have some'
                'additional features. The main goal is to design a propuct that'
                ' people will enjoy using. The main target of the product are '
                'students so the appp should not be complex',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  label(context: context, text: l10n.progress),
                  const Spacer(),
                  Text(
                    '50%',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: kBlueColor),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: kLightBlue),
                child: Stack(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: constraints.maxWidth / 2,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  label(context: context, text: l10n.task),
                  const Spacer(),
                  const Icon(
                    Icons.add,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    l10n.addTask,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const TodaysTaskSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
