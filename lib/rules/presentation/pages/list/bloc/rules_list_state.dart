import 'package:equatable/equatable.dart';
import 'package:seven/rules/presentation/pages/list/bloc/rules_list_bloc_data.dart';

abstract class RulesListState extends Equatable {
  final RulesListBlocData data;

  const RulesListState(this.data);

  factory RulesListState.initial() = InitialState;

  const factory RulesListState.loading(RulesListBlocData data) = LoadingState;

  const factory RulesListState.success(RulesListBlocData data) = SuccessState;

  const factory RulesListState.error(
    RulesListBlocData data,
    Object error,
  ) = ErrorState;
}

class InitialState extends RulesListState {
  InitialState() : super(RulesListBlocData.empty());

  @override
  List<Object?> get props => [];
}

class LoadingState extends RulesListState {
  const LoadingState(RulesListBlocData data) : super(data);

  @override
  List<Object?> get props => [data];
}

class SuccessState extends RulesListState {
  const SuccessState(RulesListBlocData data) : super(data);

  @override
  List<Object?> get props => [data];
}

class ErrorState extends RulesListState {
  final Object error;

  const ErrorState(RulesListBlocData data, this.error) : super(data);

  @override
  List<Object?> get props => [data, error];
}
