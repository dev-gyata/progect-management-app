import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progect_management_app/auth/create_account/view/create_account_page.dart';
import 'package:progect_management_app/constants/constants.dart';
import 'package:progect_management_app/l10n/l10n.dart';
import 'package:progect_management_app/onboarding/cubit/slider_dot_cubit.dart';
import 'package:progect_management_app/onboarding/data/onboarding_data.dart';
import 'package:progect_management_app/theme/theme.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _OnboardingView();
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final devSize = MediaQuery.of(context).size;
    final onboardingData = [
      OnboardingData(
        imgUrl: taskImage,
        titleText: l10n.managingText,
        desc: l10n.managingTextDesc,
      ),
      OnboardingData(
        imgUrl: scheduleImage,
        titleText: l10n.scheduleText,
        desc: l10n.scheduleTextDesc,
      ),
      OnboardingData(
        imgUrl: colaborate,
        titleText: l10n.workText,
        desc: l10n.workTextDesc,
      ),
    ];
    return BlocProvider(
      create: (context) => SliderDotCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  return PageView.builder(
                    onPageChanged: (value) =>
                        context.read<SliderDotCubit>().onChanged = value,
                    physics: const BouncingScrollPhysics(),
                    itemCount: onboardingData.length,
                    itemBuilder: (_, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            onboardingData[index].imgUrl,
                            height: devSize.height * .35,
                          ),
                          Text(
                            onboardingData[index].titleText,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: kBlackColor),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            onboardingData[index].desc,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: hintTextColor),
                            textAlign: TextAlign.center,
                          )
                        ],
                      );
                    },
                  );
                }),
              ),
              _SliderDots(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CreateAccountPage()));
                  },
                  child: Text(l10n.getStarted),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SliderDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderDotCubit, SliderDotState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => index)
              .map((e) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: state.index == e
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            height: 10,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kBlackColor,
                            ),
                          )
                        : AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: kSliderDotColor,
                            ),
                          ),
                  ))
              .toList(),
        );
      },
    );
  }
}
