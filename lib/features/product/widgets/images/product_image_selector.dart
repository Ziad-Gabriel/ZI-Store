import 'package:flutter/material.dart';

class ProductImageSelector extends StatefulWidget {
  final List<String> images;
  final int imageIndex;
  final Function(int newIndex) onTap;
  const ProductImageSelector({
    super.key,
    required this.images,
    required this.imageIndex,
    required this.onTap,
  });

  @override
  State<ProductImageSelector> createState() => _ProductImageSelectorState();
}

class _ProductImageSelectorState extends State<ProductImageSelector> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.images.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => widget.onTap(index),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: widget.imageIndex == index
                ? Theme.of(context).colorScheme.primary.withAlpha(100)
                : Theme.of(context).colorScheme.primaryContainer.withAlpha(100),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.imageIndex == index
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primaryContainer,
              width: 2,
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.all(4),
          child: Image.network(
            widget.images[index],
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
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(175),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
