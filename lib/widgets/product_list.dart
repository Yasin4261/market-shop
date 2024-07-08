import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          leading: Image.network(product.imageUrl),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Implement delete functionality here
            },
          ),
        );
      },
    );
  }
}
