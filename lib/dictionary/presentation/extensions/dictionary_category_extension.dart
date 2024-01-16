import 'package:seven/dictionary/domain/entity/dictionary_category.dart';

extension DictionaryCategoryExtension on DictionaryCategory {
  String get title {
    switch (this) {
      case DictionaryCategory.verbs:
        return 'Verbs';
      case DictionaryCategory.prepositions:
        return 'Prepositions';
      case DictionaryCategory.vocabulary:
        return 'Vocabulary';
    }
  }
}
