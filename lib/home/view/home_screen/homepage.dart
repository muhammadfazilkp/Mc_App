import 'package:flutter/material.dart';
import 'package:mc_applicaton/home/core/core.dart';
import 'package:mc_applicaton/home/view/history_screen/payment_screen.dart';
import 'package:mc_applicaton/home/view/home_screen/widget/dilog.dart';
import 'package:mc_applicaton/home/view/home_screen/widget/pyment_diolog.dart';
import 'package:mc_applicaton/home/viewmodel/getuser_provider/getuser.dart';
import 'package:mc_applicaton/home/viewmodel/visitors_provider/get_visitorsdata.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'TODO',
            style: charactortext,
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<GetUserProvider>(context, listen: false).getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const  CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Consumer<GetUserProvider>(
              builder: (context, visitorsData, child) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, index) {
                       final user = snapshot.data![index];
                      return InkWell(
                        onTap: ()=>PaymentDialogBox.show(context),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               CircleAvatar(
                                radius: 32,
                                backgroundColor: Colors.green,
                                child: CircleAvatar(radius: 30,backgroundImage: NetworkImage(user.picture.thumbnail),),
                              ),
                              const SizedBox(height: 8),
                              Text( user.name.first, style: text),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue[300],
            onPressed: () {
              DialogBox.show(context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 2.0,
            child: const Icon(Icons.people),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            backgroundColor: Colors.blue[300],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PeymentHistoryScreen()),
              );
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
