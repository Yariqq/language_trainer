import 'package:equatable/equatable.dart';
import 'package:seven/dictionary/domain/entity/dictionary_category.dart';

abstract class DictionaryDetailsEvent extends Equatable {
  const DictionaryDetailsEvent();

  const factory DictionaryDetailsEvent.getData({
    required DictionaryCategory category,
  }) = GetDataEvent;
}

class GetDataEvent extends DictionaryDetailsEvent {
  final DictionaryCategory category;

  const GetDataEvent({required this.category});

  @override
  List<Object?> get props => [category];
}
