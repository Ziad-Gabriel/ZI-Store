import 'package:flutter/material.dart';
import 'package:zi_store/core/models/product_model.dart';
import 'package:zi_store/core/widgets/app_bar.dart';
import 'package:zi_store/features/product/widgets/content/product_name.dart';
import 'package:zi_store/features/product/widgets/content/product_price.dart';
import 'package:zi_store/features/product/widgets/content/product_review.dart';
import 'package:zi_store/features/product/widgets/footer/buy_button.dart';
import 'package:zi_store/features/product/widgets/images/product_image_selector.dart';
import 'package:zi_store/features/product/widgets/images/product_images.dart';

class ProductView extends StatefulWidget {
  final int id;
  final List<String> images;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discount;
  final List<Review> reviews;
  const ProductView({
    super.key,
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discount,
    required this.reviews,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int imageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget gab = SizedBox(height: 12);
    return Scaffold(
      appBar: mainAppBar(context),
      body: ListView(
        children: [
          ProductImages(
            images: widget.images,
            id: widget.id,
            onChange: (newIndex) {
              setState(() => imageIndex = newIndex);
            },
            controller: _pageController,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            child: ProductImageSelector(
              images: widget.images,
              imageIndex: imageIndex,
              onTap: (newIndex) {
                setState(() => imageIndex = newIndex);
                _pageController.animateToPage(
                  newIndex,
                  duration: Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductName(name: widget.title),
                ProductPrice(price: widget.price, discount: widget.discount),
                gab,
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                ProductReview(reviews: widget.reviews),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BuyButton(),
    );
  }
}
