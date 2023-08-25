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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_sharp,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            "${apimodel?.location['name']}, ${apimodel?.location['country']}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.bedtime_sharp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Today, ${apimodel?.forecast['forecastday'][0]['date']}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 130,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          "${apimodel?.current['temp_c']}℃",
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18,
                                              margin: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                // color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Feelslike",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Text("℃",
                                                      style: TextStyle(
                                                          fontSize: 20)),
                                                  Text(
                                                      "${apimodel?.current['feelslike_c']}",
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18,
                                              margin: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                // color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Wind",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Icon(Icons.air),
                                                  Text(
                                                      "${apimodel?.current['wind_kph']}",
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18,
                                              margin: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                // color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Cloud",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Icon(Icons.cloud),
                                                  Text(
                                                      "${apimodel?.current['cloud']}",
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18,
                                              margin: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                // color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Humidity",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Icon(Icons.water_drop),
                                                  Text(
                                                      "${apimodel?.current['humidity']}",
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: 24,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              Container(
                                            height: 100,
                                            width: 100,
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "${index}:00",
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                Image.network(
                                                    "http:${apimodel?.forecast['forecastday'][0]['hour'][index]['condition']['icon']}"),
                                                Text(
                                                    "${apimodel?.forecast['forecastday'][0]['hour'][index]['temp_c']}℃",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
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
