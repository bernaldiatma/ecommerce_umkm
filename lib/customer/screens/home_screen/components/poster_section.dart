import 'package:ecommerce_umkm/customer/core/data_provider.dart';
import 'package:ecommerce_umkm/customer/models/poster.dart';
import 'package:ecommerce_umkm/utility/customer_utility/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PosterSection extends StatelessWidget{
  const PosterSection({super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 170,
      child: Consumer<DataProvider>(
        builder: (context, dataProvider, child) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            //itemCount di bawah untuk sementara aja
            itemCount: posterList.length,
            //TODO: Kalau udah ada datanya, itemCount ganti pakai di bawah
            //itemCount: dataProvider.poster.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppData.randomPosterBgColors[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}