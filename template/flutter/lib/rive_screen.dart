import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveScreen extends StatefulWidget {
  const RiveScreen({super.key});

  @override
  State<RiveScreen> createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {
  late final fileLoader = FileLoader.fromAsset(
    'assets/input.riv',
    riveFactory: Factory.rive,
  );

  @override
  void dispose() {
    fileLoader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiveWidgetBuilder(
      fileLoader: fileLoader,
      dataBind: DataBind.auto(),
      builder: (context, state) {
        if (state is! RiveLoaded) {
          return CircularProgressIndicator();
        }

        final vmi = state.viewModelInstance!;

        return RiveWidget(
          controller: state.controller,
          fit: Fit.layout,
        );
      }
    );
  }
}
