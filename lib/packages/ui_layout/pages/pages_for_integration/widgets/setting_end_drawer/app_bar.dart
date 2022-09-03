import 'package:fire_ble_app/packages/ui_layout/pages/pages_for_integration/widgets/setting_end_drawer/end_drawer_app_bar.dart';
import 'package:flutter/material.dart';

SliverAppBar mySliverMainAppBar(context) => SliverAppBar(
      backgroundColor: Colors.transparent,
      actions: [
        MyEndDrawer.openEndDrawer(color: Theme.of(context).cardColor),
      ],
      toolbarHeight: 35,
      floating: true,
      pinned: true,
      // title: Text(
      //   'Профиль',
      //   style: TextStyle(color: Theme.of(context).cardColor),
      // ),
      //что эпп бар будет зафиксен после скролла
      // expandedHeight: 100,

      // flexibleSpace: FlexibleSpaceBar(
      //   collapseMode: CollapseMode.none,
      //       centerTitle: true,
      //       background: Image.network(
      //         'https://picsum.photos/500/800',
      //         fit: BoxFit.cover,
      //       ),
      //     ),
    );
