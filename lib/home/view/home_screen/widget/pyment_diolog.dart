import 'package:flutter/material.dart';
import 'package:mc_applicaton/home/core/core.dart';
import 'package:mc_applicaton/home/viewmodel/visitors_provider/get_visitorsdata.dart';
import 'package:provider/provider.dart';

class PaymentDialogBox {
  static void show(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(radius: 20),
                  ),
                  boxh,
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'assertino lennfr',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  boxh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('UPI', style: charactortext),
                      Switch(
                        activeColor: Colors.green,
                        value: false,
                        onChanged: (bool value) {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('CASH', style: charactortext),
                      Switch(
                        value: false,
                        onChanged: (bool value) {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('LATER', style: charactortext),
                      Switch(
                        activeColor: Colors.green,
                        value: Provider.of<GetvisitorsData>(context)
                            .switchValue, // Set the initial value of the switch
                        onChanged: (bool value) {
                          Provider.of<GetvisitorsData>(context, listen: false)
                              .buttonClick(value);
                        },
                      ),
                    ],
                  ),
                  boxh,
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.monetization_on,
                              color: Colors.grey,
                            ),
                            label: Text(
                              '2500',
                              style: text,
                            ))),
                  ),
                    boxh,
                  const Divider(),
                
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Cancel',
                              style: text,
                            )),
                      Container(width: 1, color: Colors.black38),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Done',
                              style: text,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
