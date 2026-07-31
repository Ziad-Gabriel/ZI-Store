import 'package:flutter/material.dart';
import 'package:zi_store/repository/categories_repository.dart';

class CategoriesSelector extends StatelessWidget {
  const CategoriesSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoriesRepository().getCategories(),
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories', style: Theme.of(context).textTheme.bodyLarge),
            Card(
              elevation: 2,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: snapshot.connectionState == ConnectionState.waiting
                    ? Center(child: CircularProgressIndicator())
                    : snapshot.hasError
                    ? Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : (!snapshot.hasData || snapshot.data!.isEmpty)
                    ? Center(
                        child: Text(
                          'No categories',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 10,
                        ),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final List<String> categories = snapshot.data!;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 2,
                              ),
                              child: Card(
                                elevation: 2,
                                color: Theme.of(context).colorScheme.surface,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        categories[index],
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                      ),
                                      Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
