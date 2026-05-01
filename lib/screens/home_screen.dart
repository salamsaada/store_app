import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: FaIcon(
            FontAwesomeIcons.cartPlus,
            color: Colors.black,
          ))
        ],
        title: const Text('New Trend',
        style: TextStyle(
          color: Colors.black,
        ),),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 16 , right: 16 , top: 85),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductSevices().getAllProduct(), 
        builder: (context , snapshot){
           if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
           return GridView.builder(
            itemCount: products.length,
            clipBehavior: Clip.none,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 100,
             ), 
         itemBuilder: (context , index){
         return CustomCard(products: products[index]);
          });
} else{
  return Center(child: CircularProgressIndicator());
}
        }
      )
      ),
    );
  }
}
