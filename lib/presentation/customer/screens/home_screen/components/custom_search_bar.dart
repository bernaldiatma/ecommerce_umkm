import 'package:ecommerce_umkm/core/product_provider.dart';
import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/product_detail_screen/product_detail_screen.dart';
import 'package:ecommerce_umkm/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
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
  CustomSearchDelegate();

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
    color: Colors.black,
  );

  @override
  List<Widget> buildActions(BuildContext context) {
    final product = Provider.of<ProductProvider>(context, listen: false);
    return [
      IconButton(
        icon: const Icon(Icons.clear),
          onPressed: () {
            product.updateSuggestion('');
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
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final product = Provider.of<ProductProvider>(context, listen: false);

    if (product.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (product.searchResults.isEmpty) {
      return Center(child: Text('No results found for "$query"'));
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
            itemCount: product.searchResults.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.6,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              Product p = product.searchResults[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(product: p),
                    ),
                  );
                },
                child: ProductCard(null, p),
              );
            }
        ),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final product = Provider.of<ProductProvider>(context, listen: false);
    if (query != product.query) {
      product.updateSuggestion(query);
    }

    return ListView.builder(
      itemCount: product.searchResults.length,
      itemBuilder: (context, index) {
        var result = product.searchResults[index];
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










































