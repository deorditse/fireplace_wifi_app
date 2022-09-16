import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/cupertino.dart';

Widget navigationBarSmartFireA5_1000(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.width / 3.5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          // alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/icons/oil.png',
            fit: BoxFit.fill,
            // width: 50,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width / 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(
                  '100%',
                  style: myTextStyleFontSarpanch(fontSize: 36),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              temperature(),
              wet(),
            ],
          ),
        )
      ],
    ),
  );
}
