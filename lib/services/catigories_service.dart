import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CatigoriesService {
  Future <List<ProductModel>> getCatigoriesProducts({required String categoryName}) async{
   List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName'); 

  List<ProductModel> catigoriesList = [];
  for(int i=0 ; i<data.length; i++){
  catigoriesList.add(
   ProductModel.fromJson(data[i])
  );  
  }
  return catigoriesList;
}
  }
