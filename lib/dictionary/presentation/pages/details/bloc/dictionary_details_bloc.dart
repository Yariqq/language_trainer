import 'package:bloc/bloc.dart';
import 'package:seven/dictionary/domain/entity/dictionary_category.dart';
import 'package:seven/dictionary/domain/entity/dictionary_item.dart';
import 'package:seven/dictionary/domain/usecase/get_verbs_usecase.dart';
import 'package:seven/dictionary/domain/usecase/get_vocabulary_usecase.dart';
import 'package:seven/dictionary/presentation/pages/details/bloc/dictionary_details_event.dart';
import 'package:seven/dictionary/presentation/pages/details/bloc/dictionary_details_state.dart';

class DictionaryDetailsBloc
    extends Bloc<DictionaryDetailsEvent, DictionaryDetailsState> {
  final GetVerbsUseCase getVerbsUseCase;
  final GetVocabularyUseCase getVocabularyUseCase;

  DictionaryDetailsBloc({
    required this.getVerbsUseCase,
    required this.getVocabularyUseCase,
  }) : super(const DictionaryDetailsState.initial()) {
    on<GetDataEvent>(_onGetDataEvent);
  }

  void _onGetDataEvent(
    GetDataEvent event,
    Emitter<DictionaryDetailsState> emit,
  ) async {
    try {
      emit(DictionaryDetailsState.loading(state.data));

      List<DictionaryItem> items = [];
      switch (event.category) {
        case DictionaryCategory.verbs:
          items = await getVerbsUseCase.execute();
          break;
        case DictionaryCategory.prepositions:
          final allItems = await getVocabularyUseCase.execute();
          items = allItems
              .where((element) => element.isPreposition == true)
              .toList();
          break;
        case DictionaryCategory.vocabulary:
          final allItems = await getVocabularyUseCase.execute();
          items = allItems
              .where((element) => element.isPreposition == false)
              .toList();
          break;
      }

      emit(DictionaryDetailsState.success(state.data.copyWith(items: items)));
    } catch (e) {
      emit(DictionaryDetailsState.error(state.data, e));
    }
  }
}
