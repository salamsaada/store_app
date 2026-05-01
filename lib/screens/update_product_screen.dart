import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field_widget.dart';

class UpdateProductScreen extends StatefulWidget {
   UpdateProductScreen({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName , desc , image;

  String? price;
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product',
          style: TextStyle(
            color: Colors.black,
          ),
         ),
         backgroundColor: Colors.transparent,
         elevation: 0,
         centerTitle: true,
        ),
      
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100,),
                  CostumTextField(
                    onChange: (data){
                      productName=data;
                    },
                 hintText: 'product name',
                ),
                SizedBox(height: 10,),
                 CostumTextField(
                  onChange: (data){
                      desc=data;
                    },
                 hintText: 'discription',
                ),
                 SizedBox(height: 10,),
                 CostumTextField(
                  onChange: (data){
                      price=data;
                    },
                    inputType: TextInputType.number,
                  hintText: 'price',
                 ),
                  SizedBox(height: 10,),
                   CostumTextField(
                    onChange: (data){
                      image=data;
                    },
                  hintText: 'image',
                 ),
      
                 CustomButton(
                  text: 'Update Product',
                  onTap: () {
                    isLoading=true;
                    setState(() {
                      
                    });
                    try {
                 updateProduct(product);
                 print('success');
                  } catch (e) {
                    print(e.toString());
                  
                   }
                     isLoading=false;
                     setState(() {
                      });
                    
                  },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel product) {
    UpdateProductService().updateProduct(
      title: productName!, 
      price: price!, 
      description: desc!, 
      image: image! ,  
      category: product.category);
    
      isLoading=false;
  }
}