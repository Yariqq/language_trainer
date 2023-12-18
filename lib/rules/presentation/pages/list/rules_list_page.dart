import 'package:auto_route/auto_route.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven/app/theme/common_size.dart';
import 'package:seven/rules/domain/usecase/get_rules_usecase.dart';
import 'package:seven/rules/presentation/pages/list/bloc/rules_list_bloc.dart';
import 'package:seven/rules/presentation/pages/list/bloc/rules_list_event.dart';
import 'package:seven/rules/presentation/pages/list/bloc/rules_list_state.dart';

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
                      onTap: () {},
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              CommonSize.borderRadius,
                            ),
                          ),
                        ),
                        color: Colors.white70,
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            CommonSize.paddingDefault,
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
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: CommonSize.paddingDefault,
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

// void _onRequestTap(BuildContext context, OwnRequest request) {
//   context.pushRoute(
//     OwnRequestDetailsRoute(
//       requestId: request.id,
//       isUpdating: true,
//     ),
//   );
// }
}
