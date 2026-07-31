import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final int id;
  final String thumbnail;
  const ProductImage({super.key,required this.id,required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Hero(
              tag: '$id',
              child: Card(
                elevation: 2,
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.onPrimaryContainer,
                        Theme.of(context).colorScheme.surface,
                      ],
                      begin: AlignmentGeometry.bottomCenter,
                      end: AlignmentGeometry.center,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Image.network(
                      thumbnail,
                      fit: BoxFit.fitHeight,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                          ? child
                          : Center(
                              child: Icon(
                                Icons.image,
                                size: 80,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimary.withAlpha(175),
                              ),
                            ),
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Icon(
                          Icons.broken_image_rounded,
                          size: 80,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimary.withAlpha(175),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
  }
}