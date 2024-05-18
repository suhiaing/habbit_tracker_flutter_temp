import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
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
    constantF = readFile("data2.json");
  }

  Color successRateColor(double successRate) {
    if (successRate >= 70) {
      return Colors.green;
    } else if (successRate >= 40) {
      return Colors.orange.shade600;
    } else if (successRate >= 0) {
      return Colors.red;
    }

    return Colors.black;
  }

  int itemCountByConstraints(BoxConstraints constraints) {
    if (constraints.maxWidth < 700) {
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
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                    itemCount: constants.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: itemCountByConstraints(constraints),
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 70,
                      childAspectRatio: constraints.maxWidth > 700 ? 1 : 2,
                    ),
                    itemBuilder: (context, index) {
                      Map plans = constants[index];
                      String title = plans["title"];
                      String duration = plans["duration"];
                      double successRate = plans["success_rate"];

                      return GestureDetector(
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(30)),
                                  child: Center(
                                    child: CircularPercentIndicator(
                                      radius: 85,
                                      lineWidth: 15,
                                      percent: (successRate / 100),
                                      progressColor:
                                          successRateColor(successRate),
                                      backgroundColor:
                                          successRateColor(successRate)
                                              .withOpacity(0.1),
                                      center: Text(
                                        "${successRate.toString()}%",
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                duration,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueGrey.shade200),
                              ),
                              const SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
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