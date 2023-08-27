import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/Model/Utils/api.dart';

import '../Model/Utils/api_model.dart';
import '../Provider/platefrom.dart';
import '../Provider/theme_provider.dart';

class home_ios extends StatefulWidget {
  const home_ios({super.key});

  @override
  State<home_ios> createState() => _home_iosState();
}

class _home_iosState extends State<home_ios> {
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
            ? FutureBuilder(
                future: api_helper.api.getdata(search: titl),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    api_model? apimodel = snapshot.data;
                    return CupertinoPageScaffold(
                      child: Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage((Provider.of<
                                                        themeprovider>(context,
                                                    listen: true)
                                                .theme
                                                .isdark ==
                                            true)
                                        ? "https://w0.peakpx.com/wallpaper/20/650/HD-wallpaper-sky-clouds-dusk-nature-partly-cloudy.jpg"
                                        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT231w5_KBPhAny7YLfTm2GktZbzQA0N3UZdd8h6RdkBHjDjkM_PF79Z0Ytw2IkETaFyL8&usqp=CAU"),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(40)),
                                child: CupertinoTextFormFieldRow(
                                  onFieldSubmitted: (val) {
                                    setState(() {
                                      titl = val;
                                    });
                                  },
                                  placeholder: "Search Here..",
                                  placeholderStyle:
                                      TextStyle(color: CupertinoColors.black),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.38,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    // color:
                                    //     CupertinoColors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${apimodel?.location['name']}, ${apimodel?.location['country']}",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: CupertinoColors.black),
                                        ),
                                        Spacer(),
                                        CupertinoButton(
                                          child: Icon(
                                            CupertinoIcons.moon_fill,
                                            color: CupertinoColors.black,
                                          ),
                                          onPressed: () {
                                            Provider.of<themeprovider>(context,
                                                    listen: false)
                                                .changetheme();
                                          },
                                        ),
                                        CupertinoSwitch(
                                            thumbColor: CupertinoColors.black,
                                            value: Provider.of<platfrom>(
                                                    context,
                                                    listen: false)
                                                .isios,
                                            onChanged: (val) {
                                              Provider.of<platfrom>(context,
                                                      listen: false)
                                                  .changeolatfrom(val);
                                            }),
                                      ],
                                    ),
                                    Text(
                                      "${apimodel?.current['temp_c']} º",
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: CupertinoColors.black),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Image.network(
                                        "http:${apimodel?.current['condition']['icon']}"),
                                    Text(
                                      "${apimodel?.current['condition']['text']}",
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: CupertinoColors.black),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text(
                                      "H : ${apimodel?.current['humidity']}  C : ${apimodel?.current['cloud']}",
                                      style: TextStyle(
                                          color: CupertinoColors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.all(3),
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: CupertinoColors.black.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "Today, ${apimodel?.forecast['forecastday'][0]['date']}"),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 24,
                                  itemBuilder: (context, index) => Container(
                                    height: 50,
                                    width: 100,
                                    margin: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.black
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "${index}:00",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Image.network(
                                            "http:${apimodel?.forecast['forecastday'][0]['hour'][index]['condition']['icon']}"),
                                        Text(
                                            "${apimodel?.forecast['forecastday'][0]['hour'][index]['temp_c']}℃",
                                            style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Center(
                        child: Image.network(
                            "https://cdn.dribbble.com/users/205136/screenshots/2582152/ae-fun.gif"),
                      ),
                    ),
                  );
                })
            : CupertinoPageScaffold(
                child: Center(
                  child: Container(
                    height: 350,
                    width: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("lib/Assets/1.gif"),
                            fit: BoxFit.cover)),
                  ),
                ),
              );
      },
    );
  }
}
