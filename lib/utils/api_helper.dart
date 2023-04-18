import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_name_api/screen/movie_screen/modal/home_model.dart';

class ApiHelper{

  ApiHelper._();
  static ApiHelper apiHelper =ApiHelper._();

  Future<MovieModal> GetApiCall(String search) async {
    // print("$json");
    // print("==============================================");

    String getLink =
        "https://imdb8.p.rapidapi.com/auto-complete?q=$search";
    print("$search");
    Uri uri = Uri.parse(getLink);

    var response = await http.get(uri,headers: {"X-RapidAPI-Key" : "ee60643964msh4622b22a5b81716p1fc2e2jsn3ed0bcf1ef08"});
    print("============= ${response.statusCode}");
    var json = jsonDecode(response.body);
    print("========== $json");
    MovieModal movieModal = MovieModal.fromJson(json);
    print("============ $movieModal");
    return movieModal;
  }
}