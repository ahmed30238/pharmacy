import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/bloc/states.dart';

class PharmacyCubit extends Cubit<PharmacyStates> {
  PharmacyCubit() : super(InitState());

  static PharmacyCubit get(context) => BlocProvider.of(context);

  int counter = 0;

  incrementCount() {
    counter++;
    emit(CountState());
  }

  void deccremetCount() {
    counter--;
    emit(CountState());
  }
}
