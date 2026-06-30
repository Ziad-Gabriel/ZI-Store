import 'package:flutter/material.dart';
import 'package:zi_store/core/widgets/app_bar.dart';
import 'package:zi_store/core/widgets/drawer/drawer.dart';
import 'package:zi_store/features/home/widgets/products/products_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      drawer: MainDrawer(),
      body: ProductsList(),
    );
  }
}
