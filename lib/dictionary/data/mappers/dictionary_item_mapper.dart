import 'package:seven/common/mapper/base_mapper.dart';
import 'package:seven/dictionary/data/source/models/dictionary_item_response_body.dart';
import 'package:seven/dictionary/domain/entity/dictionary_item.dart';

class DictionaryItemMapper
    extends BaseMapper<DictionaryItem, DictionaryItemResponseBody> {
  @override
  DictionaryItem mapFromBean(DictionaryItemResponseBody src) {
    return DictionaryItem(
      eng: src.eng ?? '',
      farsi: src.farsi ?? '',
      stem: src.stem,
      isPreposition: src.preposition,
    );
  }

  @override
  DictionaryItemResponseBody mapToBean(DictionaryItem src) {
    // TODO: implement mapToBean
    throw UnimplementedError();
  }
}
