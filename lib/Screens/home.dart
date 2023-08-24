import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wather_app/Utils/api.dart';

import '../Utils/api_model.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String titl = "Surat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (
            BuildContext context,
            AsyncSnapshot<ConnectivityResult> snapshot,
          ) {
            return (snapshot.data == ConnectivityResult.mobile ||
                    snapshot.data == ConnectivityResult.wifi)
                ? Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 70,
                        width: double.infinity,
                        child: TextFormField(
                          onFieldSubmitted: (val) {
                            setState(() {
                              titl = val;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Search Here..",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future: api_helper.api.getdata(search: titl),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            } else if (snapshot.hasData) {
                              api_model? apimodel = snapshot.data;
                              return Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://img.freepik.com/free-vector/realistic-clouds-abstract-composition-with-overcast-gray-clouds-sky_1284-33932.jpg"),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 15),
                                          height: 150,
                                          width: 200,
                                          child: Column(
                                            children: [
                                              Text(
                                                "${apimodel?.location['name']}",
                                                style: TextStyle(fontSize: 28),
                                              ),
                                              Text(
                                                  "Today, ${apimodel?.forecast['forecastday'][0]['date']}"),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 15),
                                          height: 150,
                                          width: 200,
                                          child: Column(
                                            children: [
                                              Text(
                                                "${apimodel?.current['temp_c']}°",
                                                style: TextStyle(fontSize: 55),
                                              ),
                                              Text(
                                                "${apimodel?.current['condition']['text']}",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://cdn6.f-cdn.com/contestentries/329593/10695369/569a73ba941d5_thumb900.jpg"),
                                              fit: BoxFit.cover),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Feelslike",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text("℃",
                                                style: TextStyle(fontSize: 20)),
                                            Text(
                                                "${apimodel?.current['feelslike_c']}",
                                                style: TextStyle(fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://cdn6.f-cdn.com/contestentries/329593/10695369/569a73ba941d5_thumb900.jpg"),
                                              fit: BoxFit.cover),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Wind",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Icon(Icons.air),
                                            Text(
                                                "${apimodel?.current['wind_kph']}",
                                                style: TextStyle(fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://cdn6.f-cdn.com/contestentries/329593/10695369/569a73ba941d5_thumb900.jpg"),
                                              fit: BoxFit.cover),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Cloud",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Icon(Icons.cloud),
                                            Text(
                                                "${apimodel?.current['cloud']}",
                                                style: TextStyle(fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://cdn6.f-cdn.com/contestentries/329593/10695369/569a73ba941d5_thumb900.jpg"),
                                              fit: BoxFit.cover),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Humidity",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Icon(Icons.water_drop),
                                            Text(
                                                "${apimodel?.current['humidity']}",
                                                style: TextStyle(fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ],
                  )
                : Container(
                    child: Center(
                      child: Text(
                        "Please Contact to The  Network",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
          }),
    );
  }
}
