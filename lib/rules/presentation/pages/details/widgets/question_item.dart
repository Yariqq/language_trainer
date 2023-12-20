import 'package:flutter/material.dart';
import 'package:seven/app/theme/common_size.dart';
import 'package:seven/rules/domain/entity/question.dart';

const _taskContainerRadius = 12.0;
const _containerShadowColorOpacity = 0.6;
const _containerShadowBlurRadius = 7.0;
const _containerShadowOffset = Offset(0, 1.0);
const _answerFieldKey = 'answerFieldKey';

class QuestionItem extends StatelessWidget {
  final Question question;
  final int index;

  const QuestionItem({required this.question, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(CommonSize.paddingDefault),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(_taskContainerRadius),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(_containerShadowColorOpacity),
                  blurRadius: _containerShadowBlurRadius,
                  offset: _containerShadowOffset,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.content,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                TextFormField(
                  key: Key('$_answerFieldKey$index'),
                  maxLines: null,
                ),
              ],
            ),
          ),
        ),
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
