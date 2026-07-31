import 'package:flutter/material.dart';
import 'package:zi_store/models/product_model.dart';
import 'package:zi_store/features/shared/app_bar.dart';
import 'package:zi_store/features/product/widgets/content/product_name.dart';
import 'package:zi_store/features/product/widgets/content/product_price.dart';
import 'package:zi_store/features/product/widgets/content/product_review.dart';
import 'package:zi_store/features/product/widgets/footer/buy_button.dart';
import 'package:zi_store/features/product/widgets/images/product_image_selector.dart';
import 'package:zi_store/features/product/widgets/images/product_images.dart';

class ProductView extends StatefulWidget {
  final ProductModel _product;
  const ProductView({super.key, required this._product});

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
            images: widget._product.images,
            id: widget._product.id,
            onChange: (newIndex) {
              setState(() => imageIndex = newIndex);
            },
            controller: _pageController,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            child: ProductImageSelector(
              images: widget._product.images,
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
                ProductName(name: widget._product.title),
                ProductPriceAndRate(
                  price: widget._product.price,
                  discount: widget._product.discountPercentage,
                  rate: widget._product.rating,
                ),
                gab,
                Text(
                  widget._product.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                ProductReview(reviews: widget._product.reviews),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BuyButton(product: widget._product),
    );
  }
}
