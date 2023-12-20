import 'package:flutter/material.dart';
import 'package:seven/app/theme/common_size.dart';
import 'package:seven/rules/domain/entity/question_type.dart';
import 'package:seven/rules/presentation/extensions/question_type_extension.dart';
import 'package:seven/rules/presentation/pages/details/widgets/create_manually_bottom_sheet.dart';

class CreateQuestionTypeWidget extends StatelessWidget {
  final QuestionType type;
  final Function({String? content}) onCreate;

  const CreateQuestionTypeWidget({
    required this.type,
    required this.onCreate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (type == QuestionType.manually) {
          _showManuallyQuestionBottomSheet(context);
        } else {
          onCreate();
        }
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              type.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          const Icon(Icons.arrow_right),
        ],
      ),
    );
  }

  void _showManuallyQuestionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CommonSize.defaultRadius),
          topRight: Radius.circular(CommonSize.defaultRadius),
        ),
      ),
      builder: (builderContext) {
        return const CreateManuallyBottomSheet();
      },
    ).then((value) {
      if (value is String) {
        onCreate(content: value);
      }
    });
  }
}
