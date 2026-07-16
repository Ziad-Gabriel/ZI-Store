import 'package:flutter/material.dart';
import 'package:zi_store/features/home/widgets/header/category_list.dart';
import 'package:zi_store/features/home/widgets/products/grid_list.dart';
import 'package:zi_store/features/shared/app_bar.dart';
import 'package:zi_store/features/shared/drawer/drawer.dart';
import 'package:zi_store/features/home/widgets/products/products_list.dart';
import 'package:zi_store/features/shared/nav_bar/nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      drawer: MainDrawer(),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withAlpha(50),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.vertical(
                    bottom: Radius.circular(50),
                  ),
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: Column(
                      children: [
                        CategoryList(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Products',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              GridList(
                                isGrid: _isGrid,
                                onTap: (isGrid) => setState(() {
                                  _isGrid = isGrid;
                                }),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: ProductsList(isGrid: _isGrid)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
