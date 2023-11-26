import 'package:flutter/material.dart';
import 'package:mc_applicaton/home/core/core.dart';
import 'package:mc_applicaton/home/view/history_screen/payment_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'TODO',
          style: charactortext,
        )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.green,
                          child: CircleAvatar(radius: 30),
                        ),
                        const SizedBox(height: 8),
                        Text('Data', style: text),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 65,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 26,
              itemBuilder: (context, index) {
                String character =
                    String.fromCharCode('A'.codeUnitAt(0) + index);
                return Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5, bottom: 12),
                  child: Container(
                    height: 5,
                    width: 35,
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(246, 232, 228, 228),
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1),
                        ]),

                    child: Center(
                        child: Text(
                      character,
                      style: charactortext,
                    )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue[300],
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 2.0,
            child: const Icon(Icons.people),
          ),
          boxh,
          FloatingActionButton(
            backgroundColor: Colors.blue[300],
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PeymentHistoryScreen()));
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 2.0,
            child: const Icon(Icons.currency_rupee_sharp),
          ),
        ],
      ),
    );
  }
}
