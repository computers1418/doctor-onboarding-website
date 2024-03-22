import 'package:flutter/material.dart';

import '../../base/base_viewmodel.dart';

class AccountCreateViewModel extends BaseViewModel {
  late PageController controller;
  late ValueNotifier<double> selectedTab;

  AccountCreateViewModel(){
    controller = PageController(
      viewportFraction: 0.94,
      initialPage: 0,
    );
    selectedTab = ValueNotifier(0);
    controller.addListener(() { 
      selectedTab.value = controller.page??0;
    });
  }

  @override
  void dispose() {

  }
}