import 'package:seven/common/mapper/base_mapper.dart';
import 'package:seven/rules/data/source/models/question_response_body.dart';
import 'package:seven/rules/domain/entity/question.dart';

class QuestionMapper extends BaseMapper<Question, QuestionResponseBody> {
  @override
  Question mapFromBean(QuestionResponseBody src) {
    return Question(
      id: src.id ?? -1,
      ruleId: src.sectionId ?? -1,
      content: src.content ?? '',
      gptAnswer: src.gptAnswer ?? '',
      forReview: src.forReview ?? false,
      userAnswer: src.userAnswer,
      reviewerAnswer: src.reviewerAnswer,
    );
  }

  @override
  QuestionResponseBody mapToBean(Question src) {
    // TODO: implement mapToBean
    throw UnimplementedError();
  }
}
