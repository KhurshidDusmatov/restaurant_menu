import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/models/meaL.dart';
import '../provider/main_provider.dart';
import '../widgets/product_item.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return FutureBuilder(
        future: mainProvider.getFavourite(),
        builder: (BuildContext context, snapshot){
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              padding: EdgeInsets.only(top: 21),
              itemCount: 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 2,
                  crossAxisCount: 1,
                  mainAxisExtent: 350,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 30),
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(Meal.mealsUZ[snapshot.data as int], index);
              },
            );
          }
        });
  }
}