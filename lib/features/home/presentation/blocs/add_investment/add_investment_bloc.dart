import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/core/services/storage_service.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/injection_container.dart';
import './bloc.dart';

class AddInvestmentBloc extends Bloc<AddInvestmentEvent, AddInvestmentState> {
  StorageService storageService = sl<StorageService>();
  DataBaseService dataBaseService = sl<DataBaseService>();
  @override
  AddInvestmentState get initialState => InitialAddInvestmentState();

  @override
  Stream<AddInvestmentState> mapEventToState(
    AddInvestmentEvent event,
  ) async* {
    if (event is AddInvestmentButtonPressedEvent) {
      try {
        yield AddInvestmentLoadingState();
        await processCreateInvestment(event);
        yield AddInvestmentSuccessState();
      } catch (e) {
        yield AddInvestmentFailureState(message: e.toString());
      }
    }
  }

  processCreateInvestment(AddInvestmentButtonPressedEvent event) async {
    String proofOfInvestmentURL = await storageService
        .uploadProofOfInvestmentImage(event.proofOfInvestment);
    Investment investment = Investment(
      amount: event.investmentAmount,
      brokerId: event.brokerId,
      investorId: event.investorId,
      description: event.investmentDescription,
      duration: event.investmentDuration,
      investmentDate: event.investmentDate,
      percentageROI: event.percentageROI,
      proofOfInvestmentURL: proofOfInvestmentURL,
      investmentStatus: 'Pending',
      timestamp: event.timestamp,
    );
    dataBaseService.createInvestment(investment);
  }
}
