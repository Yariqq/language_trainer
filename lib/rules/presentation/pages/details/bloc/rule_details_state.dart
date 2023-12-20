import 'package:equatable/equatable.dart';
import 'package:seven/rules/presentation/pages/details/bloc/rule_details_bloc_data.dart';

abstract class RuleDetailsState extends Equatable {
  final RuleDetailsBlocData data;

  const RuleDetailsState(this.data);

  const factory RuleDetailsState.initial() = InitialState;

  const factory RuleDetailsState.loading(RuleDetailsBlocData data) =
      LoadingState;

  const factory RuleDetailsState.loadingAfterCreation(
    RuleDetailsBlocData data,
  ) = LoadingAfterCreationState;

  const factory RuleDetailsState.success(RuleDetailsBlocData data) =
      SuccessState;

  const factory RuleDetailsState.error(RuleDetailsBlocData data, Object error) =
      ErrorState;

  const factory RuleDetailsState.errorAfterCreation(
    RuleDetailsBlocData data,
    Object error,
  ) = ErrorAfterCreationState;
}

class InitialState extends RuleDetailsState {
  const InitialState() : super(const RuleDetailsBlocData.empty());

  @override
  List<Object?> get props => [];
}

class LoadingState extends RuleDetailsState {
  const LoadingState(RuleDetailsBlocData data) : super(data);

  @override
  List<Object?> get props => [data];
}

class LoadingAfterCreationState extends RuleDetailsState {
  const LoadingAfterCreationState(RuleDetailsBlocData data) : super(data);

  @override
  List<Object?> get props => [data];
}

class SuccessState extends RuleDetailsState {
  const SuccessState(RuleDetailsBlocData data) : super(data);

  @override
  List<Object?> get props => [data];
}

class ErrorState extends RuleDetailsState {
  final Object error;

  const ErrorState(RuleDetailsBlocData data, this.error) : super(data);

  @override
  List<Object?> get props => [data, error];
}

class ErrorAfterCreationState extends RuleDetailsState {
  final Object error;

  const ErrorAfterCreationState(RuleDetailsBlocData data, this.error)
      : super(data);

  @override
  List<Object?> get props => [data, error];
}
