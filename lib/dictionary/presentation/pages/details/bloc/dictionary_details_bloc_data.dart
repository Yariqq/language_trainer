import 'package:equatable/equatable.dart';
import 'package:seven/dictionary/domain/entity/dictionary_item.dart';

class DictionaryDetailsBlocData extends Equatable {
  final List<DictionaryItem> items;

  const DictionaryDetailsBlocData({
    required this.items,
  });

  DictionaryDetailsBlocData copyWith({List<DictionaryItem>? items}) {
    return DictionaryDetailsBlocData(
      items: items ?? this.items,
    );
  }

  const DictionaryDetailsBlocData.empty() : items = const [];

  @override
  List<Object?> get props => [items];
}
