import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_name_api/screen/movie_screen/modal/home_model.dart';
import 'package:movies_name_api/utils/api_helper.dart';
import 'package:permission_handler/permission_handler.dart';

class Home_Provider extends ChangeNotifier {


  TextEditingController txtmovie = TextEditingController(text: "kgf");
  MovieModal? moviedata;
  Future<MovieModal> Getapi() async {
    print("===== NAME ${txtmovie.text}");
    MovieModal m1 = await ApiHelper.apiHelper.GetApiCall(txtmovie.text);
    notifyListeners();
    return m1;
  }
  Future<void> permission()
  async {
    var Status= await[
      Permission.camera,
      Permission.location,
      Permission.storage,
    ].request();
  }

  void AddData(MovieModal movieModal)
  {
    print("======== DATA $moviedata");
    moviedata = movieModal;
    notifyListeners();
  }

}
