part of 'data_plan_bloc.dart';

abstract class DataPlanState extends Equatable {
  const DataPlanState();
  
  @override
  List<Object> get props => [];
}

class DataPlanInitial extends DataPlanState {}
class DataPlanLoading extends DataPlanState {}
class DataPlanFail extends DataPlanState {
  final String e;
  const DataPlanFail(this.e);

  @override
  List<Object> get props => [e];
}
class DataPlanSuccess extends DataPlanState {}
