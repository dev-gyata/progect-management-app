import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progect_management_app/theme/theme.dart';
import 'package:progect_management_app/widgets/cubit/visibility_cubit.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      this.leading,
      required this.hintText,
      required this.textInputType,
      required this.onValueChanged,
      this.isPassword = false});
  final String hintText;
  final Widget? leading;
  final TextInputType? textInputType;
  final void Function(String value) onValueChanged;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VisibilityCubit(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kTextfieldBackgroundColor,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
          child: Row(
            children: [
              if (leading != null) leading!,
              Builder(builder: (context) {
                return Expanded(
                  child: TextField(
                    // ignore: avoid_bool_literals_in_conditional_expressions
                    obscureText: isPassword
                        ? context.watch<VisibilityCubit>().state.hide
                        : false,
                    keyboardType: textInputType,
                    onChanged: onValueChanged,
                    decoration: InputDecoration.collapsed(
                      hintText: hintText,
                      hintStyle:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                                color: hintTextColor.withOpacity(.6),
                                fontSize: 14,
                              ),
                    ),
                  ),
                );
              }),
              if (isPassword)
                Builder(builder: (context) {
                  return InkWell(
                    onTap: () {
                      context.read<VisibilityCubit>().onVisibilityChanged =
                          !context.read<VisibilityCubit>().state.hide;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: BlocBuilder<VisibilityCubit, VisibilityState>(
                        builder: (context, state) {
                          return Icon(
                            state.hide
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black.withOpacity(.45),
                          );
                        },
                      ),
                    ),
                  );
                })
            ],
          ),
        ),
      ),
    );
  }
}
