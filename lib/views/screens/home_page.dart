import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentData = DateTime.now();

  String? birthDay;
  String? birthMonth;
  String? birthYear;

  int? currentYear;
  int? currentMonth;
  int? currentDay;

  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double w = s.width;
    double h = s.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Age Calculater"),
        centerTitle: true,
        backgroundColor: Color(0xff203A43),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Today's Date"),
                    TextField(
                      decoration: InputDecoration(
                        hintText:
                            "${currentData.day}/${currentData.month}/${currentData.year}",
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                        enabled: false,
                        disabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Birth Date"),
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: TextField(
                              controller: dayController,
                              textAlign: TextAlign.center,
                              onChanged: (val) {
                                setState(() {
                                  birthDay = val;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "DD",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 10,
                            child: TextField(
                              controller: monthController,
                              textAlign: TextAlign.center,
                              onChanged: (val) => birthMonth = val,
                              decoration: InputDecoration(
                                hintText: "MM",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 10,
                            child: TextField(
                              controller: yearController,
                              textAlign: TextAlign.center,
                              onChanged: (val) => birthYear = val,
                              decoration: InputDecoration(
                                hintText: "YYYY",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              const Spacer(
                flex: 1,
              ),
              //TODO: Buttons - clear , calculate
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 20,
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xff13547A),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            setState(() {
                              dayController.clear();
                              monthController.clear();
                              yearController.clear();

                              birthDay = null;
                              birthMonth = null;
                              birthYear = null;

                              currentYear = null;
                              currentMonth = null;
                              currentDay = null;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Clear",
                              style: TextStyle(
                                color: Color(0xff13547A),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 20,
                      child: Ink(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              currentYear =
                                  currentData.year - int.parse(birthYear!);
                              if ((currentData.month +
                                      int.parse(birthMonth!)) >=
                                  12) {
                                currentYear = currentYear! + 1;
                                currentMonth = (currentData.month +
                                    int.parse(birthMonth!) -
                                    12 +
                                    1);
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff13547A),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              ("Calculate"),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              //TODO: Present Age
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Present Age",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color(0xff13547A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${currentYear ?? "00"}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "YY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${currentMonth ?? "00"}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "MM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "DD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const Spacer(
                flex: 1,
              ),

              //TODO: Next Birthday
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Next Birthday",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color(0xff13547A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.amber,
                    onTap: () {
                      setState(() {
                        //  emailController.clear();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "00",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "MM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "00",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "MM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
