import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/fortune_item.dart';

class SpinWheel extends StatelessWidget {
  const SpinWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Stack(
        children: [
          FortuneWheel(
            animateFirst: false,
            selected: context.read<StreamController<int>>().stream,
            rotationCount: 10,
            indicators: const [],
            items: List.generate(
              7,
              (index) => FortuneItem(
                child: CustomFortuneItem(multiplier: index + 1),
                style: FortuneItemStyle(
                  color: index % 2 == 0 ? orange2 : orange1,
                  borderColor: darkOrange,
                ),
              ),
            ),
            onAnimationEnd: () {
              context.read<SpinWheelCubit>().setIsSpinning(false);
              context.read<SpinWheelCubit>().updateRotationCount();
            },
          ),
          Align(alignment: Alignment.center, child: Image.asset(wheelBorder)),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                spinningPointer,
                width: 50,
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
