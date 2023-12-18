import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seven/app/theme/common_size.dart';
import 'package:seven/common/extensions/map_with_index.dart';
import 'package:seven/home/tab_bar/models/tab_bar_tab_model.dart';

class BottomNavigationTabBar extends StatelessWidget {
  final List<TabBarTabModel> tabs;
  final TabsRouter tabsRouter;

  const BottomNavigationTabBar({
    required this.tabs,
    required this.tabsRouter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        items: tabs
            .mapWithIndex(
              (tab, index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  tab.iconPath,
                  width: CommonSize.iconSize,
                  height: CommonSize.iconSize,
                  colorFilter: tabsRouter.activeIndex == index
                      ? null
                      : const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.srcIn,
                        ),
                ),
                label: tab.title(context),
              ),
            )
            .toList(),
      ),
    );
  }
}
