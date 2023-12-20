import 'package:seven/common/mapper/base_mapper.dart';
import 'package:seven/rules/domain/entity/question_type.dart';

class QuestionTypeMapper extends BaseMapper<QuestionType?, String?> {
  @override
  QuestionType? mapFromBean(String? src) {
    // TODO: implement mapFromBean
    throw UnimplementedError();
  }

  @override
  String? mapToBean(QuestionType? src) {
    switch (src) {
      case QuestionType.sentence:
        return 'sentence';
      case QuestionType.story:
        return 'story';
      default:
        return null;
    }
  }
}
