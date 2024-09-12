import 'package:ecommerce/widgets/icon.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.prod});
  final List<ProductModel> prod;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height / 8,
        actions: const [
          Icon(
            Icons.search_rounded,
            size: 30,
          ),
          SizedBox(
            width: 25,
          )
        ],
        leading: Row(
          children: [
            const Spacer(),
            CustomIcon(
              image: "assets/icons/arrow.png",
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "clothes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: widget.prod.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4),
              itemBuilder: (context, index) {
                var product = widget.prod[index];
                return product.category == "men's clothing" ||
                        product.category == "women's clothing"
                    ? ProductCard(product: product)
                    : null;
              },
            ))
          ],
        ),
      ),
    );
  }
}
