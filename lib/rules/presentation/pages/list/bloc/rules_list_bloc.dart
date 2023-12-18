import 'package:bloc/bloc.dart';
import 'package:seven/rules/domain/usecase/get_rules_usecase.dart';
import 'package:seven/rules/presentation/pages/list/bloc/rules_list_event.dart';
import 'package:seven/rules/presentation/pages/list/bloc/rules_list_state.dart';

class RulesListBloc extends Bloc<RulesListEvent, RulesListState> {
  final GetRulesUseCase getRulesUseCase;

  RulesListBloc({
    required this.getRulesUseCase,
  }) : super(RulesListState.initial()) {
    on<GetDataEvent>(_onGetDataEvent);
  }

  void _onGetDataEvent(
    GetDataEvent event,
    Emitter<RulesListState> emit,
  ) async {
    try {
      emit(RulesListState.loading(state.data));

      final rules = await getRulesUseCase.execute();

      emit(
        RulesListState.success(
          state.data.copyWith(rules: rules),
        ),
      );
    } catch (e) {
      emit(RulesListState.error(state.data, e));
    }
  }
}
