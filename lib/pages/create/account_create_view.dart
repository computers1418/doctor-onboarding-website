import 'package:doctor_app/pages/create/account_create_viewmodel.dart';
import 'package:doctor_app/pages/create/components/header.dart';
import 'package:doctor_app/pages/create/tabs/tab_bar_widget.dart';
import 'package:doctor_app/responsive/size_responsive.dart';
import 'package:doctor_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../constants/colors_const.dart';
import '../../responsive/text_responsive.dart';
import '../login/animations/toast.dart';
import 'tabs/address.dart';
import 'tabs/details_tab.dart';
import 'tabs/expertise.dart';

class AccountCreateView extends StatefulWidget {
  const AccountCreateView({super.key});

  @override
  State<AccountCreateView> createState() => _AccountCreateViewState();
}

class _AccountCreateViewState extends State<AccountCreateView> {
  late AccountCreateViewModel _viewModel;

  @override
  void initState() {
    _viewModel = AccountCreateViewModel();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {

    // SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    //   statusBarColor: Colors.white.withOpacity(0.6),
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  toolbarHeight: height<650 ? SizeResponsive.get(context, 60) : SizeResponsive.get(context, 70),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          width: SizeResponsive.get(context, 50),
                          height: SizeResponsive.get(context, 45),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorsConst.secondaryLight
                          ),
                          child: IconButton(
                            onPressed: (){
                              Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
                            }, icon: Icon(Icons.arrow_back, color: Colors.white, size: SizeResponsive.get(context, 20),))
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: height<650 ?  6 : 12),
                          child: const Toast(message: "Save your progress to pick up right where you left off when you return.",)),
                      )
                    ],
                  ),
                ),
                const Header(),
                TabBarWidget(viewModel: _viewModel),
                ValueListenableBuilder(
                  valueListenable: _viewModel.selectedTab,
                  builder: (_, val, __) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(val==0 ? "Details": val==1? "Expertise": "Address",style: TextStyle(
                        fontFamily: "Aloevera",
                        fontSize: TextResponsive.get(context, 20),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF363636)
                      )),
                    );
                  }
                ),
                const SizedBox(height: 6,),
                Expanded(
                  child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _viewModel.controller,
                      children: [
                        DetailsTab(viewModel: _viewModel),
                        ExpertiseTab(viewModel: _viewModel),
                        AddressTab(viewModel: _viewModel)
                      ]
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}