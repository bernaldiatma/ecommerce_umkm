import 'package:ecommerce_umkm/presentation/customer/models/category.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: List.generate(
          // TODO: ListCategory.length nanti diganti
          ListCategory.length,
          (index) => Padding(
            padding: EdgeInsets.only(right: 12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: ChoiceChip(
                label: Text(
                  // TODO: ListCategory[index] nanti diganti
                  ListCategory[index],
                  style: selectIndex == index
                      ? TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        )
                      : TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                ),
                selected: selectIndex == index,
                onSelected: (bool selected) {
                  setState(() {
                    selectIndex = selected ? index : selectIndex;
                  });
                },
                selectedColor: Colors.deepPurple.shade50,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: selectIndex == index ? 2 : 0,
                pressElevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 1,
                ),
                checkmarkColor: Colors.deepPurple,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(
                  color: selectIndex == index
                      ? Colors.transparent
                      : Colors.grey.shade300,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
