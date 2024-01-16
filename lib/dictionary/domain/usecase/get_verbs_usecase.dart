import 'package:seven/common/usecase/base_future_usecase.dart';
import 'package:seven/dictionary/domain/entity/dictionary_item.dart';
import 'package:seven/dictionary/domain/repository/dictionary_repository.dart';

class GetVerbsUseCase extends BaseFutureUseCase<void, List<DictionaryItem>> {
  final DictionaryRepository repository;

  GetVerbsUseCase({required this.repository});

  @override
  Future<List<DictionaryItem>> execute([void input]) {
    return repository.getVerbs();
  }
}
