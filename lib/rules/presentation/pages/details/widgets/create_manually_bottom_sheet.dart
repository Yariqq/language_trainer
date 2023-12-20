import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:seven/app/theme/common_size.dart';

class CreateManuallyBottomSheet extends StatefulWidget {
  const CreateManuallyBottomSheet({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateManuallyBottomSheetState();
  }
}

class _CreateManuallyBottomSheetState extends State<CreateManuallyBottomSheet> {
  final _questionController = TextEditingController();
  bool _createButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: CommonSize.paddingDefault,
          top: CommonSize.paddingLarge,
          right: CommonSize.paddingDefault,
          bottom: CommonSize.doubleDefault,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () => context.popRoute(),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.close),
              ),
            ),
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(
                labelText: 'Question',
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _createButtonEnabled = true;
                  });
                } else {
                  setState(() {
                    _createButtonEnabled = false;
                  });
                }
              },
            ),
            const SizedBox(height: CommonSize.paddingDefault),
            ElevatedButton(
              onPressed: () {
                if (_createButtonEnabled) {
                  context.popRoute(_questionController.text);
                }
              },
              style: const ButtonStyle().copyWith(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.all(CommonSize.paddingMedium),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  _createButtonEnabled
                      ? Colors.deepPurpleAccent
                      : Colors.white60,
                ),
              ),
              child: Text(
                'Apply',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: _createButtonEnabled ? Colors.white : null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}