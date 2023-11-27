import 'package:flutter/material.dart';
import 'package:mc_applicaton/home/core/core.dart';

class PeymentHistoryScreen extends StatelessWidget {
  const PeymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
             Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
        ),
        title: Center(
          child: Text(
            'TODO',
            style: charactortext,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
               
              },
              child: Text(
                'Clear',
                style: text,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'payments',
                  style: charactortext,
                ),
                Text(
                  'Attendance',
                  style: charactortext,
                ),
              ],
            ),
            boxh,
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Adam john,wick',
                  style: text,
                )),
            Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Adam john,wick',
                  style: text,
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[200],
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 2.0,
        child: const Icon(Icons.share),
      ),
    );
  }
}
