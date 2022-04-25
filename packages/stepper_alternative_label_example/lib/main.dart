import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stepper Alternative Label',
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        // type: StepperType.vertical,
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index < 3) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
            isActive: _index == 0,
            title: const Text('Step 1 title'),
            content: Container(
                alignment: Alignment.centerLeft,
                child: const Text('Content for Step 1')),
            label: const Text('Step 1'),
            subtitle: const Text('Step 1 subtitle'),
          ),
          Step(
            isActive: _index == 1,
            title: const Text('Step 2 title'),
            content: const Text('Content for Step 2'),
            subtitle: const Text('Step 2 subtitle'),
            label: const Text('Step 2'),
          ),
          Step(
            isActive: _index == 2,
            title: const Text('Step 3 title'),
            content: const Text('Content for Step 3'),
            subtitle: const Text('Step 3 subtitle'),
            label: const Text('Step 3'),
          ),
          Step(
            isActive: _index == 3,
            title: const Text('Step 4 title'),
            content: const Text('Content for Step 4'),
            subtitle: const Text('Step 4 subtitle'),
            label: const Text('Step 4'),
          ),
        ],
      ),
    );
  }
}
