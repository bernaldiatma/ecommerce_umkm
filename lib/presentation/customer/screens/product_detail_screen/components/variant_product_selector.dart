import 'package:ecommerce_umkm/models/product.dart';
import 'package:flutter/material.dart';
/* TODO hapus comment jika akan dipakai (karena ada error belum implementasi di server
class VariantProductSelector extends StatefulWidget {
  final Product product;

  const VariantProductSelector({Key? key, required this.product}) : super(key: key);

  @override
  State<VariantProductSelector> createState() => _VariantProductSelectorState();
}

class _VariantProductSelectorState extends State<VariantProductSelector> {
  int _selectIndex = 0;

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.product.variant.length,
          itemBuilder: (context, index) {
            widget.product.variant[index];
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(widget.product.variant[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _selectIndex == index ? Colors.white : Colors.black,
                    ),
                ),
                selected: _selectIndex == index,
                onSelected: (bool isSelected) {
                  setState(() {
                    _selectIndex = index;
                  });
                },
                backgroundColor: Colors.white,
                selectedColor: Colors.deepPurple,
                showCheckmark: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
 */