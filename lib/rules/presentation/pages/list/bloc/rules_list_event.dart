import 'package:equatable/equatable.dart';

abstract class RulesListEvent extends Equatable {
  const RulesListEvent();

  const factory RulesListEvent.getData() = GetDataEvent;
}

class GetDataEvent extends RulesListEvent {
  const GetDataEvent();

  @override
  List<Object?> get props => [];
}
