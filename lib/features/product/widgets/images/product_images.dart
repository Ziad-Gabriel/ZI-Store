import 'package:flutter/material.dart';

class ProductImages extends StatefulWidget {
  final int id;
  final List<String> images;
  final Function(int newIndex) onChange;
  final PageController controller;
  const ProductImages({
    super.key,
    required this.images,
    required this.id,
    required this.onChange,
    required this.controller
  });

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {

  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        child: PageView.builder(
          itemCount: widget.images.length,
          controller: widget.controller,
          onPageChanged: (value) {
            widget.onChange(value);
          },
          itemBuilder: (context, index) {
            return Hero(
              tag: '${widget.id}',
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
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withAlpha(175),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
