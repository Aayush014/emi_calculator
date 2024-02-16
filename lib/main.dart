import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            actions: const [
              Icon(Icons.menu, size: 28),
              SizedBox(
                width: 15,
              )
            ],
            backgroundColor: const Color(0xffA6E3E9),
            title: const Text(
              'AKP',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            )),
        backgroundColor: const Color(0xffA6E3E9),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Loan Amount',
                  style: TextStyle(fontSize: 23),
                ),
                Text(
                  loanAmount.toStringAsFixed(0),
                  style: const TextStyle(fontSize: 23),
                ),
              ],
            ),
            Slider(
              value: loanAmount,
              min: 50000,
              max: 500000,
              divisions: 100,
              thumbColor: const Color(0xff1B262C),
              activeColor: const Color(0xff1B262C),
              onChanged: (value) {
                setState(() {
                  loanAmount = value;
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Interest Rate',
                  style: TextStyle(fontSize: 23),
                ),
                Text(
                  iRate.toStringAsFixed(0),
                  style: const TextStyle(fontSize: 23),
                ),
              ],
            ),
            Slider(
              value: iRate,
              min: 0,
              max: 100,
              divisions: 100,
              thumbColor: const Color(0xff1B262C),
              activeColor: const Color(0xff1B262C),
              onChanged: (value) {
                setState(() {
                  iRate = value;
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Term',
                  style: TextStyle(fontSize: 23),
                ),
                Text(
                  '${term.toStringAsFixed(0)} Months',
                  style: const TextStyle(fontSize: 23),
                ),
              ],
            ),
            Slider(
              value: term,
              min: 0,
              max: 120,
              divisions: 10,
              thumbColor: const Color(0xff1B262C),
              activeColor: const Color(0xff1B262C),
              onChanged: (value) {
                setState(() {
                  term = value;
                });
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: height / 3,
              width: width / 1.1,
              decoration: BoxDecoration(
                  color: const Color(0xff3282B8),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 4, spreadRadius: 1)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width / 1,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 2),
                        ),
                      ),
                      child: const Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Loan Amount',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500)),
                        Text("$loanAmount",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Interest Rate',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500)),
                        Text("$iRate",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Term',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500)),
                        Text("$term",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Your Loan EMI is',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500)),
                        Text('₹ ${emiAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              width: 150,
              height: 65,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    emiAmount = calc_emi(loanAmount, iRate, term);
                  });
                },
                backgroundColor: const Color(0xff0F4C75),
                child: const Text('Calculate',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double emiAmount = 0.00;
double loanAmount = 50000;
double iRate = 0;
double term = 0;

double calc_emi(double p, double r, double t) {
  double emi;
  // one month interest
  r = r / (12 * 100);
  // one month period
  t = t * 12;
  // Calculate EMI as per formula
  emi = (p * r * pow(1 + r, t)) / (pow(1 + r, t) - 1);
  return (emi);
}
