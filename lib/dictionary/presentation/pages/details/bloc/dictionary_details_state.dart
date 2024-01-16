import 'package:equatable/equatable.dart';
import 'package:seven/dictionary/presentation/pages/details/bloc/dictionary_details_bloc_data.dart';

abstract class DictionaryDetailsState extends Equatable {
  final DictionaryDetailsBlocData data;

  const DictionaryDetailsState(this.data);

  const factory DictionaryDetailsState.initial() = InitialState;

  const factory DictionaryDetailsState.loading(DictionaryDetailsBlocData data) =
      LoadingState;

  const factory DictionaryDetailsState.success(DictionaryDetailsBlocData data) =
      SuccessState;

  const factory DictionaryDetailsState.error(
    DictionaryDetailsBlocData data,
    Object error,
  ) = ErrorState;
}

class InitialState extends DictionaryDetailsState {
  const InitialState() : super(const DictionaryDetailsBlocData.empty());

  @override
  List<Object?> get props => [];
}

class LoadingState extends DictionaryDetailsState {
  const LoadingState(DictionaryDetailsBlocData data) : super(data);

  @override
  List<Object?> get props => [data];
}

class SuccessState extends DictionaryDetailsState {
  const SuccessState(DictionaryDetailsBlocData data) : super(data);

  @override
  List<Object?> get props => [data];
}

class ErrorState extends DictionaryDetailsState {
  final Object error;

  const ErrorState(DictionaryDetailsBlocData data, this.error) : super(data);

  @override
  List<Object?> get props => [data, error];
}
