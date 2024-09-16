import 'package:flutter/material.dart';
import 'package:productrsnginfo/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          PopupMenuButton(
            onSelected: (bool ascending) {
              productProvider.sortProductsByPrice(ascending: ascending);
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: true, child: Text('Price: Low to High')),
              PopupMenuItem(value: false, child: Text('Price: High to Low')),
            ],
          ),
        ],
      ),
      body: productProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];
                return ListTile(
                  leading:
                      Image.network(product.imageUrl, width: 50, height: 50),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
