import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/consts.dart';
import 'package:triple_seven_slots_game/theme.dart';

class SlotsBackLight extends StatefulWidget {
  const SlotsBackLight({Key? key}) : super(key: key);

  @override
  State<SlotsBackLight> createState() => _SlotsBackLightState();
}

class _SlotsBackLightState extends State<SlotsBackLight> with TickerProviderStateMixin {
  late final List<List<AnimationController>> _animationControllers;

  @override
  void initState() {
    _animationControllers = List.generate(
        numberOfItemsInSlot,
        (_) => List.generate(
              numberOfSlots,
              (_) => AnimationController(vsync: this, duration: const Duration(milliseconds: 600)),
            ));
    super.initState();
  }

  @override
  void dispose() {
    for (final controllers in _animationControllers) {
      for (final controller in controllers) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SlotMachineBloc, SlotMachineState>(
      listenWhen: (prev, curr) => prev.isSpinning != curr.isSpinning,
      listener: _slotMachineListener,
      child: Column(
        children: List.generate(
            3,
            (columnIndex) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      3,
                      (rowIndex) =>
                          _gradientBacklight(_animationControllers[columnIndex][rowIndex])),
                )),
      ),
    );
  }

  void _slotMachineListener(BuildContext context, SlotMachineState state) {
    if (!state.isSpinning && state.prize != null) {
      final winSlotsControllers = _animationControllers[state.winRow!];
      for (final controller in winSlotsControllers) {
        controller.forward().then((_) => controller.reset());
      }
    }
  }

  Widget _gradientBacklight(AnimationController animationController) {
    return FadeTransition(
      opacity: animationController,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: darkPurple1),
        ),
      ),
    );
  }
}
