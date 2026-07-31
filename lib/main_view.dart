import 'package:flutter/material.dart';
import 'package:zi_store/features/cart/view/cart_view.dart';
import 'package:zi_store/features/fav/view/fav_view.dart';
import 'package:zi_store/features/home/view/home_view.dart';
import 'package:zi_store/features/settings/view/settings_view.dart';
import 'package:zi_store/features/shared/app_bar.dart';
import 'package:zi_store/features/shared/drawer/drawer.dart';
import 'package:zi_store/features/shared/nav_bar/nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> mainScreens = [
    HomeView(),
    FavView(),
    CartView(),
    SettingsView(),
  ];
  int screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: mainAppBar(context),
      drawer: MainDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height - 180,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(50),
          ),
          child: mainScreens[screenIndex],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: screenIndex,
        onTap: (index) => setState(() {
          screenIndex = index;
        }),
      ),
    );
  }
}
