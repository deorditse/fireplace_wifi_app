import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartPrime_1000/smartPrime_1000.dart';
import 'package:flutter/material.dart';

rowWithDomain({context}) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/premium-icon-internet-3710036 1 (Traced).png',
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            // Get.to(SmartPrime1000Page());
          },
          child: Text(
             'abc-fireplace.com',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                ),
          ),
        ),
      ],
    );
