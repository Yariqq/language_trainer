import 'package:bloc/bloc.dart';
import 'package:seven/rules/domain/usecase/create_question_usecase.dart';
import 'package:seven/rules/domain/usecase/get_questions_usecase.dart';
import 'package:seven/rules/presentation/pages/details/bloc/rule_details_event.dart';
import 'package:seven/rules/presentation/pages/details/bloc/rule_details_state.dart';

class RuleDetailsBloc extends Bloc<RuleDetailsEvent, RuleDetailsState> {
  final GetQuestionsUseCase getQuestionsUseCase;
  final CreateQuestionUseCase createQuestionUseCase;

  RuleDetailsBloc({
    required this.getQuestionsUseCase,
    required this.createQuestionUseCase,
  }) : super(const RuleDetailsState.initial()) {
    on<GetDataEvent>(_onGetDataEvent);
    on<CreateQuestionEvent>(_onCreateQuestionEvent);
  }

  void _onGetDataEvent(
    GetDataEvent event,
    Emitter<RuleDetailsState> emit,
  ) async {
    try {
      emit(RuleDetailsState.loading(state.data));

      final questions = await getQuestionsUseCase.execute(event.ruleId);

      emit(
        RuleDetailsState.success(
          state.data.copyWith(
            questions: questions,
            ruleId: event.ruleId,
          ),
        ),
      );
    } catch (e) {
      emit(RuleDetailsState.error(state.data, e));
    }
  }

  void _onCreateQuestionEvent(
    CreateQuestionEvent event,
    Emitter<RuleDetailsState> emit,
  ) async {
    try {
      emit(RuleDetailsState.loadingAfterCreation(state.data));

      await createQuestionUseCase.execute(
        CreateQuestionUseCaseParams(
          type: event.type,
          content: event.content,
          ruleId: int.parse(state.data.ruleId),
        ),
      );

      final questions = await getQuestionsUseCase.execute(state.data.ruleId);

      emit(RuleDetailsState.success(state.data.copyWith(questions: questions)));
    } catch (e) {
      emit(RuleDetailsState.errorAfterCreation(state.data, e));
    }
  }
}
