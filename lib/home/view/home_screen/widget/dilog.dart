import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_applicaton/home/core/core.dart';
import 'package:mc_applicaton/home/model/visitors_model.dart';
import 'package:mc_applicaton/home/viewmodel/visitors_provider/get_visitorsdata.dart';
import 'package:provider/provider.dart';

class DialogBox {
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
                child: Consumer<GetvisitorsData>(
                  builder: (context, value, child) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Enter visitor Details',
                          style: charactortext,
                        ),
                        boxh,
                        TextFormField(
                          controller: value.firstNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter visitor name';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(CupertinoIcons.person_fill),
                            border: OutlineInputBorder(),
                            hintText: "Enter visitor name",
                          ),
                        ),
                        boxh,
                        TextFormField(
                          controller: value.lastnameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter the name';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(CupertinoIcons.person_fill),
                            border: OutlineInputBorder(),
                            hintText: "Enter Sponsorname ",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: text,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    value.addNote(Visitors(
                                        firstname:
                                            value.firstNameController.text.trim(),
                                        lastname:
                                            value.lastnameController.text.trim()));
                                            Navigator.pop(context);
                                              value.firstNameController.text='';
                                                value.lastnameController.text='';
                                  }
                                },
                                child: Text(
                                  'Save',
                                  style: text,
                                )),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
