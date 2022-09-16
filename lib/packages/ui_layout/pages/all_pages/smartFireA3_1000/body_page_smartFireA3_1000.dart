import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/button_play_pause_fireplace_sceleton_for_all_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/tittle_fireplace_model_name.dart';
import 'package:flutter/material.dart';

class MainContentBodySmartFireA31000 extends StatelessWidget {
  MainContentBodySmartFireA31000({Key? key, required this.titleModel})
      : super(key: key);
  String titleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        myTitleModel(titleModel: titleModel),
        Expanded(
          child: ButtonPlayStopPauseFireplaceForAllPages(
            alertMessage: 'разогрев системы',
          ),
        ),
        myNavigationBar(context),
      ],
    );
  }
}
