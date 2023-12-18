import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:seven/app/router/app_router.gr.dart';
import 'package:seven/home/tab_bar/bottom_navigation_tab_bar.dart';
import 'package:seven/home/tab_bar/models/dictionary_tab_model.dart';
import 'package:seven/home/tab_bar/models/rules_tab_model.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,
      routes: const [
        RulesListRoute(),
        DictionaryRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationTabBar(
          tabs: [
            RulesTabModel(),
            DictionaryTabModel(),
          ],
          tabsRouter: tabsRouter,
        );
      },
    );
  }
}
