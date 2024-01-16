import 'package:auto_route/auto_route.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:seven/app/theme/common_size.dart';
import 'package:seven/rules/domain/entity/question_type.dart';
import 'package:seven/rules/domain/usecase/create_question_usecase.dart';
import 'package:seven/rules/domain/usecase/delete_question_usecase.dart';
import 'package:seven/rules/domain/usecase/get_questions_usecase.dart';
import 'package:seven/rules/domain/usecase/send_to_review_usecase.dart';
import 'package:seven/rules/presentation/pages/details/bloc/rule_details_bloc.dart';
import 'package:seven/rules/presentation/pages/details/bloc/rule_details_event.dart';
import 'package:seven/rules/presentation/pages/details/bloc/rule_details_state.dart';
import 'package:seven/rules/presentation/pages/details/widgets/create_question_type_widget.dart';
import 'package:seven/rules/presentation/pages/details/widgets/question_item.dart';

const _tabBarLength = 2;

@RoutePage()
class RuleDetailsPage extends StatelessWidget {
  final String title;
  final int ruleId;

  const RuleDetailsPage({required this.title, required this.ruleId, super.key});

  @override
  Widget build(BuildContext context) {
    final di = CherryPick.openRootScope();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider(
        create: (context) => RuleDetailsBloc(
          getQuestionsUseCase: di.resolve<GetQuestionsUseCase>(),
          createQuestionUseCase: di.resolve<CreateQuestionUseCase>(),
          deleteQuestionUseCase: di.resolve<DeleteQuestionUseCase>(),
          sendToReviewUseCase: di.resolve<SendToReviewUseCase>(),
        )..add(RuleDetailsEvent.getData(ruleId: ruleId.toString())),
        child: DefaultTabController(
          length: _tabBarLength,
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              bottom: const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.deepPurpleAccent,
                tabs: [
                  Tab(text: 'Active'),
                  Tab(text: 'On review'),
                ],
              ),
            ),
            body: BlocConsumer<RuleDetailsBloc, RuleDetailsState>(
              listener: (context, state) {
                context.loaderOverlay.hide();
                if (state is LoadingAfterCreationState) {
                  context.loaderOverlay.show();
                }

                if (state is ErrorAfterCreationState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Something went wrong -- ${state.error}'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ErrorState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, size: 100),
                        Text('Something went wrong (${state.error})'),
                      ],
                    ),
                  );
                }

                final activeQuestions =
                    state.data.questions.where((e) => !e.forReview).toList();
                final questionsForReview =
                    state.data.questions.where((e) => e.forReview).toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TabBarView(
                        children: [
                          activeQuestions.isEmpty
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error, size: 100),
                                    Text('Oops, nothing to show :('),
                                  ],
                                )
                              : ListView.separated(
                                  padding: const EdgeInsets.only(
                                    left: CommonSize.paddingDefault,
                                    top: CommonSize.paddingDefault,
                                    right: CommonSize.paddingDefault,
                                    bottom: CommonSize.doubleDefault,
                                  ),
                                  itemCount: activeQuestions.length,
                                  itemBuilder: (context, index) {
                                    return QuestionItem(
                                      question: activeQuestions[index],
                                      index: index,
                                      onDelete: () => _onDelete(
                                        context,
                                        activeQuestions[index].id.toString(),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: CommonSize.paddingDefault,
                                    );
                                  },
                                ),
                          questionsForReview.isEmpty
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error, size: 100),
                                    Text('Oops, nothing to show :('),
                                  ],
                                )
                              : ListView.separated(
                                  padding: const EdgeInsets.only(
                                    left: CommonSize.paddingDefault,
                                    top: CommonSize.paddingDefault,
                                    right: CommonSize.paddingDefault,
                                    bottom: CommonSize.doubleDefault,
                                  ),
                                  itemCount: questionsForReview.length,
                                  itemBuilder: (context, index) {
                                    return QuestionItem(
                                      question: questionsForReview[index],
                                      index: index,
                                      onDelete: () => _onDelete(
                                        context,
                                        questionsForReview[index].id.toString(),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: CommonSize.paddingDefault,
                                    );
                                  },
                                )
                        ],
                      ),
                    ),
                    const SizedBox(height: CommonSize.paddingSmall),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: CommonSize.paddingDefault,
                        right: CommonSize.paddingDefault,
                        bottom: CommonSize.doubleDefault,
                      ),
                      child: ElevatedButton(
                        onPressed: () =>
                            _showCreateQuestionBottomSheet(context),
                        style: const ButtonStyle().copyWith(
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.all(CommonSize.paddingMedium),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                            Colors.deepPurpleAccent,
                          ),
                        ),
                        child: Text(
                          'Generate',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showCreateQuestionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CommonSize.defaultRadius),
          topRight: Radius.circular(CommonSize.defaultRadius),
        ),
      ),
      builder: (builderContext) {
        return SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: CommonSize.paddingDefault,
            top: CommonSize.paddingLarge,
            right: CommonSize.paddingDefault,
            bottom: CommonSize.doubleDefault,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CreateQuestionTypeWidget(
                type: QuestionType.sentence,
                onCreate: ({content}) {
                  _createQuestion(context, type: QuestionType.sentence);
                  builderContext.popRoute();
                },
              ),
              const SizedBox(height: CommonSize.paddingDefault),
              CreateQuestionTypeWidget(
                type: QuestionType.story,
                onCreate: ({content}) {
                  _createQuestion(context, type: QuestionType.story);
                  builderContext.popRoute();
                },
              ),
              const SizedBox(height: CommonSize.paddingDefault),
              CreateQuestionTypeWidget(
                type: QuestionType.manually,
                onCreate: ({content}) {
                  _createQuestion(context, content: content);
                  builderContext.popRoute();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _createQuestion(
    BuildContext context, {
    QuestionType? type,
    String? content,
  }) {
    context.read<RuleDetailsBloc>().add(
          RuleDetailsEvent.createQuestion(type: type, content: content),
        );
  }

  void _onDelete(BuildContext context, String questionId) {
    context.read<RuleDetailsBloc>().add(
          RuleDetailsEvent.deleteQuestion(questionId: questionId),
        );
  }
}
