import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/widgets/up_bar_home_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<dynamic>> constantF;
  @override
  void initState() {
    super.initState();
    constantF = readFile();
  }

  Color successRateColor(double successRate) {
    if (successRate >= 70) {
      return Colors.green;
    } else if (successRate >= 40) {
      return Colors.orange.shade700;
    } else if (successRate >= 0) {
      return Colors.red.shade700;
    }

    return Colors.black;
  }

  int itemCountByConstraints(BoxConstraints constraints) {
    if (constraints.maxWidth < 750) {
      return 1;
    } else if (constraints.maxWidth < 1100) {
      return 2;
    } else if (constraints.maxWidth < 1450) {
      return 3;
    }
    return 4;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: constantF,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          constants = snapshot.data!;
          return LayoutBuilder(
            builder: ((context, constraints) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UpBarHomePage(),
                    const SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: GridView.builder(
                          itemCount: constants.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: itemCountByConstraints(constraints),
                            mainAxisSpacing: 50.0,
                            crossAxisSpacing: 70,
                            childAspectRatio:
                                constraints.maxWidth < 750 ? 2 : 1.2,
                          ),
                          itemBuilder: (context, index) {
                            Map plans = constants[index];
                            String title = plans["title"];
                            String duration = plans["duration"];
                            double successRate = plans["success_rate"];

                            return GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 5,
                                      ),
                                      BoxShadow(
                                        color: Colors.white70,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 5,
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 85,
                                      lineWidth: 15,
                                      percent: (successRate / 100),
                                      progressColor:
                                          successRateColor(successRate),
                                      backgroundColor:
                                          successRateColor(successRate)
                                              .withOpacity(0.25),
                                      center: Text(
                                        "${successRate.toString()}%",
                                        style: const TextStyle(fontSize: 28),
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                    ),
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                    Text(
                                      duration,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blueGrey.shade200),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }
}


          // List<dynamic> firstDate = constants[0]["data"];
          // int lengthOfDate = (firstDate.length) + 1;
          // return ParticularDataTable(
          //     lengthOfDate: lengthOfDate, firstDate: firstDate);



          
                        //  onTap: () {
                        //     Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //         builder: (context) {
                        //           return ParticularDataTable(habbitCount: 5, firstDate: firstDate);
                        //         },
                        //       ),
                        //     );
                        //   },