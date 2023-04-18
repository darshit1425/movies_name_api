import 'package:flutter/material.dart';
import 'package:movies_name_api/screen/movie_screen/modal/home_model.dart';
import 'package:movies_name_api/screen/movie_screen/provider/home_provider.dart';
import 'package:movies_name_api/utils/api_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  Home_Provider? ProviderT;
  Home_Provider? ProviderF;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Home_Provider>(context, listen: false).permission();
  }


  @override
  Widget build(BuildContext context) {
    ProviderT = Provider.of<Home_Provider>(context, listen: true);
    ProviderF = Provider.of<Home_Provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: Text(
            "movies",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          // elevation: 5,
        ),
        body: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () async {
            //
            //     Map<Permission,PermissionStatus> Status= await[
            //       Permission.camera,
            //       Permission.location,
            //       Permission.storage,
            //     ].request();
            //   },
            //   child: Text("Permission"),
            // ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: ProviderT!.txtmovie,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(onPressed: (){
              ProviderT!.Getapi();
            }, child: Text("Search")),
            ProviderT!.txtmovie.text.isNotEmpty ? FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  MovieModal moviedata = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: moviedata.d.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.red,
                          child: ListTile(
                            // leading: Container(
                            //   child: Image.asset("assets/images/oneplus.png"),
                            // ),
                            leading: Container(
                              height: 100,
                              width: 100,
                              child: moviedata.d[index].i != null
                                  ? Image.network(
                                      "${moviedata.d[index].i!.imageUrl}")
                                  : Text(
                                      "Not Available",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                            subtitle: Text(
                              "${moviedata.d[index].l}",
                              style: TextStyle(color: Colors.grey.shade400),
                            ),
                            title: Text(
                              "${moviedata.d[index].qid}",
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Text(
                              "${moviedata.d[index].id}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return Container(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              },
              future: ProviderF!.Getapi(),
            ) : Center(child: Text("Please Search Any Movie"),),
          ],
        ),
      ),
    );
  }
}
