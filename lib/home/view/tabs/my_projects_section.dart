import 'package:flutter/material.dart';
import 'package:progect_management_app/project_details/view/project_details_page.dart';
import 'package:progect_management_app/theme/theme.dart';
import 'package:progect_management_app/utils/navigation_utils.dart';

class MyProjectsSectionWidget extends StatelessWidget {
  const MyProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 240,
        child: Center(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return const _CustomProjectCard();
              }),
        ),
      ),
    );
  }
}

class _CustomProjectCard extends StatelessWidget {
  const _CustomProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    const src =
        'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () => context.navigate(page: const ProjectDetails()),
        child: SizedBox(
          width: 250,
          height: 240,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kWhiteColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.white70,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0.5, 1),
                    spreadRadius: 5,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      src,
                      height: 80,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const Text(
                    'Fintech app Design - ios and Android',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(
                            radius: 14,
                            foregroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
                          ),
                          Positioned(
                              left: 25,
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                        )),
                                    border: Border.all(color: Colors.white),
                                    shape: BoxShape.circle,
                                    color: Colors.red),
                              )),
                          Positioned(
                            left: 50,
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')),
                                  border: Border.all(color: Colors.white),
                                  shape: BoxShape.circle,
                                  color: Colors.green),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Progress',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: hintTextColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '50%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: kBlueColor),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 6,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: kLightBlue),
                                child: Stack(
                                  children: [
                                    LayoutBuilder(
                                      builder: (context, constraints) {
                                        return Container(
                                          width: constraints.maxWidth / 2,
                                          height: 6,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  labelAndValue('Deadline', '03, April 2023', context),
                  labelAndValue('Tasks left', '12', context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget labelAndValue(String label, String value, BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: hintTextColor),
        ),
        const Spacer(),
        Text(value,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: kBlackColor))
      ],
    );
  }
}
