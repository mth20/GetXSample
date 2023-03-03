import 'package:mm_ex_rate/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_ex_rate/routes/app_routes.dart';
import 'widgets/rate_ui.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    return Obx(
      () {
        AppState state = homeController.state.value;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Central Bank of Myanmar'),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.about);
                },
                icon: const Icon(Icons.keyboard_double_arrow_right_outlined),
              )
            ],
          ),
          body: state is LoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is ErrorState
                  ? Center(
                      child: Text(state.err),
                    )
                  : state is SuccessState
                      ? RefreshIndicator(
                          onRefresh: () async {
                            await homeController.getRate();
                          },
                          child: RateUI(rate: state.data))
                      : const SizedBox(),
        );
      },
    );
  }
}
