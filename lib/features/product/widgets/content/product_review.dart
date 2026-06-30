import 'package:flutter/material.dart';
import 'package:zi_store/core/models/product_model.dart';

class ProductReview extends StatelessWidget {
  final List<Review> reviews;
  const ProductReview({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Reviews', style: Theme.of(context).textTheme.bodyLarge),
        ListView.builder(
          shrinkWrap: true,
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final Review theReview = reviews[index];
            return Card(
              elevation: 2,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      theReview.reviewerName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      theReview.reviewerEmail,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary.withAlpha(150),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      theReview.comment,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text('${theReview.rating}'),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
