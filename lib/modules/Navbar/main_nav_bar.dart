import 'package:flutter/material.dart';
import 'package:sports_news_app/data/notifiers.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: Colors.white,
              indicatorColor: Colors.transparent,
              labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((
                states,
              ) {
                final selected = states.contains(MaterialState.selected);
                return TextStyle(
                  color: selected
                      ? Color(0xFF43A047)
                      : Colors.grey.shade700, // sporty green
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 12,
                );
              }),
              iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((
                states,
              ) {
                final selected = states.contains(MaterialState.selected);
                return IconThemeData(
                  color: selected
                      ? Color(0xFF43A047)
                      : Colors.grey.shade700, // sporty green for icon
                  size: selected ? 28 : 26,
                );
              }),
            ),
            child: NavigationBar(
              height: 70,
              elevation: 6,
              backgroundColor: Colors.white,
              selectedIndex: selectedPage,
              onDestinationSelected: (value) {
                selectedPageNotifier.value = value;
              },
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations: [
                _buildNavItem(
                  Icons.sports_soccer_sharp,
                  'Matches',
                  0,
                  selectedPage,
                ),
                _buildNavItem(Icons.newspaper_sharp, 'News', 1, selectedPage),
                _buildNavItem(
                  Icons.emoji_events_outlined,
                  'Leagues',
                  2,
                  selectedPage,
                ),
                _buildNavItem(
                  Icons.groups_outlined,
                  'Following',
                  3,
                  selectedPage,
                ),
                _buildNavItem(Icons.list, 'More', 4, selectedPage),
              ],
            ),
          ),
        );
      },
    );
  }

  NavigationDestination _buildNavItem(
    IconData icon,
    String label,
    int index,
    int selectedPage,
  ) {
    final bool isSelected = index == selectedPage;

    return NavigationDestination(
      icon: Icon(
        icon,
        color: isSelected
            ? Color(0xFF43A047)
            : Colors.grey.shade700, // only icon changes color
        size: isSelected ? 28 : 26,
      ),
      label: label,
    );
  }
}
