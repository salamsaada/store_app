import 'package:store_app/helper/api.dart';

class AllCatigoryService {
 Future <dynamic> getAllCatigory() async{
  List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/categories');

  return data;

  }
 }
  
