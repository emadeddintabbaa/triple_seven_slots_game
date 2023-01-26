import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_state.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:triple_seven_slots_game/widgets/common/background_gradient_scaffold.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_button.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_wheel.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SpinWheelScreen extends StatelessWidget {
  final StreamController<int> _fortuneWheelNotifier = StreamController<int>();

  SpinWheelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<StreamController<int>>(
      create: (context) => _fortuneWheelNotifier,
      builder: (context, child) => GradientBackgroundScaffold(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: SpinWheel(asset: coinIc, defaultWin: 1000),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: BlocBuilder<SpinWheelCubit, SpinWheelState>(
                    builder: (context, state) => state.isWheelAvailable
                        ? const SpinButton()
                        : Text(
                            state.timeLeft,
                            style: TextStyles.clarendonReg22,
                          ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: ZoomTapAnimation(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(arrowLeftIc, width: 60),
              ),
            )
          ],
        ),
      ),
    );
  }
}
