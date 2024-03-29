import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/services/operator_card_service.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async {
      if (event is OperatorCardGet) {
        try {
          emit(OperatorCardLoading());
          final operatordCards = await OperatorCardService().getOperatorCards();
          emit(OperatorCardSuccess(operatordCards));
        } catch (e) {
          emit(OperatorCardFail(e.toString()));
        }
      }
    });
  }
}
