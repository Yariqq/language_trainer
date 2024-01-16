import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seven/app/theme/common_size.dart';
import 'package:seven/rules/domain/entity/question.dart';
import 'package:seven/rules/presentation/pages/details/bloc/rule_details_bloc.dart';
import 'package:seven/rules/presentation/pages/details/bloc/rule_details_event.dart';

const _taskContainerRadius = 12.0;
const _containerShadowColorOpacity = 0.6;
const _containerShadowBlurRadius = 7.0;
const _containerShadowOffset = Offset(0, 1.0);

class QuestionItem extends StatefulWidget {
  final Question question;
  final int index;
  final VoidCallback onDelete;

  const QuestionItem({
    required this.question,
    required this.index,
    required this.onDelete,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return QuestionItemState();
  }
}

class QuestionItemState extends State<QuestionItem> {
  final _formKey = GlobalKey<FormState>();

  final _controller = TextEditingController();

  @override
  void initState() {
    if (widget.question.userAnswer?.isNotEmpty ?? false) {
      _controller.text = widget.question.userAnswer!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.index),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => widget.onDelete(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: const BorderRadius.all(
              Radius.circular(_taskContainerRadius),
            ),
          ),
          const SizedBox(width: CommonSize.paddingLittle),
          if (widget.question.gptAnswer.isNotEmpty) ...[
            SlidableAction(
              onPressed: (context) => _showRevealDialog(
                context,
                widget.question.gptAnswer,
              ),
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
              icon: Icons.rate_review,
              label: 'Reveal',
              borderRadius: const BorderRadius.all(
                Radius.circular(_taskContainerRadius),
              ),
            ),
            const SizedBox(width: CommonSize.paddingLittle),
          ],
        ],
      ),
      endActionPane: widget.question.forReview
          ? null
          : ActionPane(
              motion: const ScrollMotion(),
              children: [
                const SizedBox(width: CommonSize.paddingLittle),
                SlidableAction(
                  onPressed: (context) => _onSendOnReview(context, widget.question),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.send,
                  label: 'Send to review',
                  borderRadius: const BorderRadius.all(
                    Radius.circular(_taskContainerRadius),
                  ),
                ),
              ],
            ),
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.question.content,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              TextFormField(
                controller: _controller,
                enabled: widget.question.userAnswer?.isEmpty,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Fill in the field';
                  }

                  return null;
                },
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRevealDialog(BuildContext context, String gptAnswer) {
    showAdaptiveDialog(
      context: context,
      barrierDismissible: true,
      builder: (builderContext) {
        return AlertDialog(
          content: Text(gptAnswer),
          backgroundColor: Colors.white,
          actionsPadding: const EdgeInsets.only(
            bottom: CommonSize.paddingSmall,
            right: CommonSize.paddingSmall,
          ),
          actions: [
            TextButton(
              onPressed: () => builderContext.popRoute(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void _onSendOnReview(BuildContext context, Question question) {
    if (_formKey.currentState?.validate() == true) {
      final userAnswer = _controller.text;

      context.read<RuleDetailsBloc>().add(
        RuleDetailsEvent.sendToReview(
          question: question,
          userAnswer: userAnswer,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
