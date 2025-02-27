import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';

class EvenOddDisplay extends StatelessWidget {
  const EvenOddDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<CounterModel, bool>(
      selector: (context, model) => model.counter % 4 == 0,
      builder: (context, isChanged, child) {
        print('rebuild EvenOddDisplay');

        return Text(
          isChanged ? '4배수' : '나머지',
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}
