import 'package:flutter/material.dart';

rowWithDomain({context}) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
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
