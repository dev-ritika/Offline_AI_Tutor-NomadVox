import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topLeft,
      child: TextFormField(
        style: Theme.of(context).textTheme.titleMedium,
        onChanged: (value) {
          context.read<OnboardingCubit>().enterName(value);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if ((value?.length ?? 0) < 2) {
            return "Enter valid name";
          } else {
            //   context.read<OnboardingCubit>().enterName(value);
            return null;
          }
        },
        decoration: const InputDecoration(hintText: "Enter your name"),
      ),
    );
  }
}
