import 'package:get/get.dart';
import 'package:mm_ex_rate/data/models/rate_model.dart';
import 'package:mm_ex_rate/data/repository/rate_repository.dart';

class HomeController extends GetxController {
  Rx<AppState> state = AppState().obs;

//   RxInt count = 0.obs;
//   increase() {
//     count.value++;
//   }
//   decrease() {
//     count.value--;
//   }

  @override
  void onInit() {
    getRate();
    super.onInit();
  }

  @override
  void onClose() {
    // print('dispose');
    super.onClose();
  }

  getRate() async {
    state.value = LoadingState();
    RateModel? rate = await RateRepository.getRates();
    if (rate == null) {
      state.value = ErrorState('server error');
    } else {
      state.value = SuccessState(rate);
    }
  }
}

class AppState {}

class LoadingState extends AppState {}

class ErrorState extends AppState {
  String err;
  ErrorState(this.err);
}

class SuccessState extends AppState {
  RateModel data;
  SuccessState(this.data);
}
