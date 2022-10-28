import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';

class RowWithNameAndTitleFireplace extends StatelessWidget {
  const RowWithNameAndTitleFireplace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          // flex: 2,
          child: Text(
            '${FireplaceConnectionGetXController.instance.titleModel}',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          // flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'подключено',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: myColorActivity,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
              FittedBox(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: myColorActivity,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
