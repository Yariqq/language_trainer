import 'package:auto_route/annotations.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven/app/theme/common_size.dart';
import 'package:seven/dictionary/domain/entity/dictionary_category.dart';
import 'package:seven/dictionary/domain/usecase/get_verbs_usecase.dart';
import 'package:seven/dictionary/domain/usecase/get_vocabulary_usecase.dart';
import 'package:seven/dictionary/presentation/extensions/dictionary_category_extension.dart';
import 'package:seven/dictionary/presentation/pages/details/bloc/dictionary_details_bloc.dart';
import 'package:seven/dictionary/presentation/pages/details/bloc/dictionary_details_event.dart';
import 'package:seven/dictionary/presentation/pages/details/bloc/dictionary_details_state.dart';

@RoutePage()
class DictionaryDetailsPage extends StatelessWidget {
  final DictionaryCategory category;

  const DictionaryDetailsPage({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final di = CherryPick.openRootScope();

    return BlocProvider(
      create: (context) => DictionaryDetailsBloc(
        getVerbsUseCase: di.resolve<GetVerbsUseCase>(),
        getVocabularyUseCase: di.resolve<GetVocabularyUseCase>(),
      )..add(DictionaryDetailsEvent.getData(category: category)),
      child: BlocBuilder<DictionaryDetailsBloc, DictionaryDetailsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(category.title),
            ),
            body: state is LoadingState
                ? const Center(child: CircularProgressIndicator())
                : state is ErrorState
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error, size: 100),
                            Text('Something went wrong (${state.error})'),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: CommonSize.paddingDefault,
                          vertical: CommonSize.paddingLarge,
                        ),
                        itemCount: state.data.items.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.data.items[index].eng,
                              ),
                              const SizedBox(width: CommonSize.paddingDefault),
                              Text(
                                state.data.items[index].stem != null &&
                                        state.data.items[index].stem!.isNotEmpty
                                    ? '${state.data.items[index].farsi} (${state.data.items[index].stem})'
                                    : state.data.items[index].farsi,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: CommonSize.paddingDefault,
                          );
                        },
                      ),
          );
        },
      ),
    );
  }
}
