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
    required this.controller,
  });

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${widget.id}',
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.shadow,
            ],
            begin: AlignmentGeometry.bottomCenter,
            end: AlignmentGeometry.topCenter,
          ),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              offset: Offset(0, 1),
              blurRadius: 10,
            ),
          ],
        ),
        child: PageView.builder(
          itemCount: widget.images.length,
          controller: widget.controller,
          onPageChanged: (value) {
            widget.onChange(value);
          },
          itemBuilder: (context, index) {
            return Image.network(
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
            );
          },
        ),
      ),
    );
  }
}
