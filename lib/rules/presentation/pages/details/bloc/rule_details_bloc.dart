import 'package:bloc/bloc.dart';
import 'package:seven/rules/domain/entity/review_question_model.dart';
import 'package:seven/rules/domain/usecase/create_question_usecase.dart';
import 'package:seven/rules/domain/usecase/delete_question_usecase.dart';
import 'package:seven/rules/domain/usecase/get_questions_usecase.dart';
import 'package:seven/rules/domain/usecase/send_to_review_usecase.dart';
import 'package:seven/rules/presentation/pages/details/bloc/rule_details_event.dart';
import 'package:seven/rules/presentation/pages/details/bloc/rule_details_state.dart';

class RuleDetailsBloc extends Bloc<RuleDetailsEvent, RuleDetailsState> {
  final GetQuestionsUseCase getQuestionsUseCase;
  final CreateQuestionUseCase createQuestionUseCase;
  final DeleteQuestionUseCase deleteQuestionUseCase;
  final SendToReviewUseCase sendToReviewUseCase;

  RuleDetailsBloc({
    required this.getQuestionsUseCase,
    required this.createQuestionUseCase,
    required this.deleteQuestionUseCase,
    required this.sendToReviewUseCase,
  }) : super(const RuleDetailsState.initial()) {
    on<GetDataEvent>(_onGetDataEvent);
    on<CreateQuestionEvent>(_onCreateQuestionEvent);
    on<SendToReviewEvent>(_onSendToReviewEvent);
    on<DeleteQuestionEvent>(_onDeleteQuestionEvent);
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

  void _onSendToReviewEvent(
    SendToReviewEvent event,
    Emitter<RuleDetailsState> emit,
  ) async {
    try {
      emit(RuleDetailsState.loadingAfterCreation(state.data));

      await sendToReviewUseCase.execute(
        SendToReviewUseCaseParams(
          ruleId: state.data.ruleId,
          questionId: event.question.id.toString(),
          data: ReviewQuestionModel(
            userAnswer: event.userAnswer,
            reviewerAnswer: event.question.reviewerAnswer,
            forReview: true,
          ),
        ),
      );

      final questions = await getQuestionsUseCase.execute(state.data.ruleId);

      emit(RuleDetailsState.success(state.data.copyWith(questions: questions)));
    } catch (e) {
      emit(RuleDetailsState.errorAfterCreation(state.data, e));
    }
  }

  void _onDeleteQuestionEvent(
    DeleteQuestionEvent event,
    Emitter<RuleDetailsState> emit,
  ) async {
    try {
      emit(RuleDetailsState.loadingAfterCreation(state.data));

      await deleteQuestionUseCase.execute(
        DeleteQuestionUseCaseParams(
          ruleId: state.data.ruleId,
          questionId: event.questionId,
        ),
      );

      final questions = await getQuestionsUseCase.execute(state.data.ruleId);

      emit(RuleDetailsState.success(state.data.copyWith(questions: questions)));
    } catch (e) {
      emit(RuleDetailsState.errorAfterCreation(state.data, e));
    }
  }
}
