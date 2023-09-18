import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:progect_management_app/auth/create_account/view/create_account_page.dart';
import 'package:progect_management_app/auth/login/cubit/login_cubit.dart';
import 'package:progect_management_app/home/view/home_page.dart';
import 'package:progect_management_app/l10n/l10n.dart';
import 'package:progect_management_app/theme/theme.dart';
import 'package:progect_management_app/utils/dialog_utils.dart';
import 'package:progect_management_app/widgets/custom_textfield.dart';
import 'package:progect_management_app/widgets/unfocus_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
          repository: RepositoryProvider.of<AuthenticationRepository>(context)),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final height = MediaQuery.of(context).viewPadding.top;

    final devSize = MediaQuery.of(context).size;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          DialogUtils.showErrorDialog(
              errorMessage: state.errorMessage!, context: context);
        }
      },
      child: UnfocusWidget(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: devSize.width * .06,
                right: devSize.width * .06,
                top: height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    l10n.welcomeBack,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.black),
                  ),
                  Text(
                    l10n.pleaseLoginText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    l10n.email,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Builder(
                    builder: (context) {
                      final hasError = context.select<LoginCubit, bool>(
                          (cubit) => cubit.state.email.displayError != null);
                      return CustomTextfield(
                          errorMessage:
                              hasError ? 'Invalid email address' : null,
                          hintText: l10n.emailNameExample,
                          textInputType: TextInputType.emailAddress,
                          onValueChanged: (value) {
                            context.read<LoginCubit>().onEmailChanged(value);
                          });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    l10n.password,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Builder(
                    builder: (context) {
                      final hasError = context.select<LoginCubit, bool>(
                          (cubit) => cubit.state.password.displayError != null);
                      return CustomTextfield(
                        errorMessage: hasError ? 'Invalid password' : null,
                        hintText: l10n.passwordExample,
                        textInputType: TextInputType.visiblePassword,
                        isPassword: true,
                        onValueChanged: (value) {
                          context.read<LoginCubit>().onPasswordChanged(value);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        l10n.forgotPassword,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 14, color: kBlueColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Builder(
                      builder: (context) {
                        final isLoading = context.select<LoginCubit, bool>(
                            (cubit) => cubit.state.status.isInProgress);
                        return TextButton(
                          onPressed: context.read<LoginCubit>().onSumbit,
                          child: isLoading
                              ? const CircularProgressIndicator.adaptive()
                              : Text(l10n.logIn),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.dontHaveAccount,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CreateAccountPage(),
                            ),
                          );
                        },
                        child: Text(
                          l10n.signUp,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 14, color: kBlueColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
