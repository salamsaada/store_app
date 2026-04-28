import 'dart:convert';
import 'package:http/http.dart' as http;

class AllCatigoryService {
 Future <dynamic> getAllCatigory() async{
  http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));

  if (response.statusCode==200) {
  List<dynamic> data = jsonDecode(response.body);
  
  return data;
}else{
  throw Exception('there is a problem in status code ${response.statusCode}');
}
  }
 }
  
