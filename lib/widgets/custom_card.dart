
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_screen.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    super.key,
    required this.products,
  });

  ProductModel products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductScreen.id , arguments: products);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: 130,
            // width: 220,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(10, 10),
                ),
              ]
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      products.title.substring(0,6), 
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                       r'$' '${products.price.toString()}', 
                        style: TextStyle(
                        fontSize: 16,
                       // color: Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            //bottom: 300,
            top: -60,
            child: Image.network(
              products.image,
              height: 100,
              width: 100,
            )),
        ],
      ),
    );
  }
}