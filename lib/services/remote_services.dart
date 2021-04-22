import 'package:http/http.dart' as http;
import 'package:product/models/apimodel.dart';


class ApiServices {
  static var client = http.Client();

  static Future<List<Welcome>> fetchProducts() async {
    var response = await client.get( Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline')
        );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return welcomeFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
