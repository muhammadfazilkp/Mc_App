import 'package:flutter/material.dart';
import 'package:mc_applicaton/home/view/home_screen/homepage.dart';
import 'package:mc_applicaton/home/viewmodel/getuser_provider/getuser.dart';
import 'package:mc_applicaton/home/viewmodel/visitors_provider/get_visitorsdata.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigator(context);
    Provider.of<GetUserProvider>(context,listen: false).getUsers();
    Provider.of<GetvisitorsData>(context,listen: false).getNotes();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.amber),
      ),
    );
  }

  Future<void> navigator(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage())));
  }
}
