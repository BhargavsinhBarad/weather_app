import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:wather_app/Utils/api.dart';

import '../Utils/api_model.dart';

class home_Screen extends StatefulWidget {
  const home_Screen({super.key});

  @override
  State<home_Screen> createState() => _home_ScreenState();
}

class _home_ScreenState extends State<home_Screen> {
  String titl = "Surat";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (
        BuildContext context,
        AsyncSnapshot<ConnectivityResult> snapshot,
      ) {
        return (snapshot.data == ConnectivityResult.mobile ||
                snapshot.data == ConnectivityResult.wifi)
            ? Scaffold(
                body: FutureBuilder(
                    future: api_helper.api.getdata(search: titl),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        api_model? apimodel = snapshot.data;
                        return Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://w0.peakpx.com/wallpaper/20/650/HD-wallpaper-sky-clouds-dusk-nature-partly-cloudy.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                TextFormField(
                                  onFieldSubmitted: (val) {
                                    setState(() {
                                      titl = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Search Here..",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(40))),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Center(
                            child: Image.network(
                                "https://cdn.dribbble.com/users/2973561/screenshots/5757826/loading__.gif"),
                          ),
                        ),
                      );
                    }),
              )
            : Scaffold(
                body: Center(
                  child: Container(
                    height: 350,
                    width: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "lib/Assets/page-not-response-5631129-4699348.gif"),
                            fit: BoxFit.cover)),
                  ),
                ),
              );
      },
    );
  }
}
