import 'package:auto_route/auto_route.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven/app/router/app_router.gr.dart';
import 'package:seven/app/theme/common_size.dart';
import 'package:seven/rules/domain/usecase/get_rules_usecase.dart';
import 'package:seven/rules/presentation/pages/list/bloc/rules_list_bloc.dart';
import 'package:seven/rules/presentation/pages/list/bloc/rules_list_event.dart';
import 'package:seven/rules/presentation/pages/list/bloc/rules_list_state.dart';

const _taskContainerRadius = 12.0;
const _containerShadowColorOpacity = 0.6;
const _containerShadowBlurRadius = 7.0;
const _containerShadowOffset = Offset(0, 1.0);

@RoutePage()
class RulesListPage extends StatelessWidget {
  const RulesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final di = CherryPick.openRootScope();

    return Scaffold(
      body: BlocProvider(
        create: (context) => RulesListBloc(
          getRulesUseCase: di.resolve<GetRulesUseCase>(),
        )..add(const RulesListEvent.getData()),
        child: BlocBuilder<RulesListBloc, RulesListState>(
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

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CommonSize.paddingDefault,
                vertical: CommonSize.paddingLarge,
              ),
              child: SafeArea(
                child: ListView.separated(
                  itemCount: state.data.rules.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.pushRoute(
                          RuleDetailsRoute(
                            title: state.data.rules[index].name,
                            ruleId: state.data.rules[index].id,
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.all(CommonSize.paddingDefault),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(_taskContainerRadius),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(_containerShadowColorOpacity),
                              blurRadius: _containerShadowBlurRadius,
                              offset: _containerShadowOffset,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.data.rules[index].name,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: CommonSize.paddingLarge,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
