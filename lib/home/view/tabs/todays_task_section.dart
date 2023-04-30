import 'package:flutter/material.dart';
import 'package:progect_management_app/theme/theme.dart';

class TodaysTaskSectionWidget extends StatelessWidget {
  const TodaysTaskSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          5,
          (index) => _TodaysTaskCard(
                index: index,
              )),
    );
  }
}

class _TodaysTaskCard extends StatelessWidget {
  const _TodaysTaskCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: hintTextColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Onboarding screen design'),
                  Text(
                    'Fintech app design',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: hintTextColor),
                  )
                ],
              ),
              const Icon(
                Icons.more_horiz,
                color: hintTextColor,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '8:00 AM - 9:30 AM',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: hintTextColor),
              ),
              DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: index.isEven
                          ? const Color(0xFFf1f7f2)
                          : const Color(0xFFeff2f7)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      index.isEven ? 'Completed' : 'In progress',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          color: index.isEven
                              ? const Color(0xFF528d60)
                              : kBlueColor),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
