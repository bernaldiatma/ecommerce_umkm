import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:ecommerce_umkm/customer/screens/product_detail_screen/product_detail_screen.dart';
import 'package:ecommerce_umkm/widget/product_card.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final List<Product> allProducts;

  const CustomSearchBar({Key? key, required this.allProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(allProducts: allProducts),
        );
      },
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 12),
              Text(
                "Telusuri...",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<Product> allProducts;

  CustomSearchDelegate({required this.allProducts});

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
    color: Colors.black,
  );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];
    for (var product in allProducts) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GridView.builder(
        itemCount: matchQuery.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.6,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            Product product = matchQuery[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: ProductCard(null, product),
            );
          }
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchQuery = [];
    for (var product in allProducts) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.name),
          onTap: () {
            query = result.name;
            showResults(context);
          },
        );
      },
    );
  }
}










































