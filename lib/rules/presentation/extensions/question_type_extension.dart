import 'package:seven/rules/domain/entity/question_type.dart';

extension QuestionTypeExtension on QuestionType {
  String get title {
    switch (this) {
      case QuestionType.sentence:
        return 'Sentence';
      case QuestionType.story:
        return 'Story';
      case QuestionType.manually:
        return 'Manually';
    }
  }
}
