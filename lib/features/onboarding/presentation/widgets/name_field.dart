import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class NameField extends StatefulWidget {
  const NameField({super.key});

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text =
        context.read<OnboardingCubit>().state.enteredName ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topLeft,
      child: TextFormField(
        controller: textEditingController,
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
