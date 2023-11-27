
import 'package:flutter/material.dart';
import 'package:mc_applicaton/home/core/core.dart';


class  PaymentDialogBox {
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
                child: Column(children: [
                  const Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(radius: 20,)),
                  boxh,
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'assertino lennfr',
                      style: text,
                    ),
                  ),
                  boxh,
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text('UPI',style: charactortext,),
                       const  Icon(Icons.abc),
                       


                    ],
                  )

                ]),
              ),
            ),
          );
        });
  }
}
