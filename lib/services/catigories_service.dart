import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class CatigoriesService {
  Future <List<ProductModel>> getCatigoriesProducts({required String categoryName}) async{
   http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$categoryName')); 

   if (response.statusCode == 200) {
  List<dynamic> data = jsonDecode(response.body);
  
  List<ProductModel> catigoriesList = [];
  for(int i=0 ; i<data.length; i++){
  catigoriesList.add(
   ProductModel.fromJson(data[i])
  );  
  }
  return catigoriesList;
}else{
  throw Exception('there is a problem in status code ${response.statusCode}');
}
  }
}