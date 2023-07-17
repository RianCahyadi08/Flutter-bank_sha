import 'package:bank_sha/models/data_plan_form_model.dart';
import 'package:bank_sha/services/transaction_service.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(DataPlanInitial()) {
    on<DataPlanEvent>((event, emit) async {

      if (event is DataPlanPost) {
        try {
          DataPlanLoading();
          await TransactionService().dataPlan(event.data);
          DataPlanSuccess();
        } catch (e) {
          emit(DataPlanFail(e.toString()));
        }
      }
    });
  }
}
