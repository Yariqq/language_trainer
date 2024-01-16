import 'package:equatable/equatable.dart';
import 'package:seven/rules/domain/entity/question.dart';
import 'package:seven/rules/domain/entity/question_type.dart';

abstract class RuleDetailsEvent extends Equatable {
  const RuleDetailsEvent();

  const factory RuleDetailsEvent.getData({required String ruleId}) =
      GetDataEvent;

  const factory RuleDetailsEvent.createQuestion({
    QuestionType? type,
    String? content,
  }) = CreateQuestionEvent;

  const factory RuleDetailsEvent.sendToReview({
    required Question question,
    required String userAnswer,
  }) = SendToReviewEvent;

  const factory RuleDetailsEvent.deleteQuestion({required String questionId}) =
      DeleteQuestionEvent;
}

class GetDataEvent extends RuleDetailsEvent {
  final String ruleId;

  const GetDataEvent({required this.ruleId});

  @override
  List<Object?> get props => [ruleId];
}

class CreateQuestionEvent extends RuleDetailsEvent {
  final QuestionType? type;
  final String? content;

  const CreateQuestionEvent({this.type, this.content});

  @override
  List<Object?> get props => [type, content];
}

class SendToReviewEvent extends RuleDetailsEvent {
  final Question question;
  final String userAnswer;

  const SendToReviewEvent({
    required this.question,
    required this.userAnswer,
  });

  @override
  List<Object?> get props => [question, userAnswer];
}

class DeleteQuestionEvent extends RuleDetailsEvent {
  final String questionId;

  const DeleteQuestionEvent({required this.questionId});

  @override
  List<Object?> get props => [questionId];
}
