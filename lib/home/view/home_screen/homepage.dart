import 'package:flutter/material.dart';
import 'package:mc_applicaton/home/core/core.dart';
import 'package:mc_applicaton/home/view/history_screen/payment_screen.dart';
import 'package:mc_applicaton/home/view/home_screen/widget/dilog.dart';
import 'package:mc_applicaton/home/view/home_screen/widget/pyment_diolog.dart';
import 'package:mc_applicaton/home/viewmodel/getuser_provider/getuser.dart';
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
            return const  Center(child:  CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Column(
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
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, index) {
                        final user = snapshot.data![index];
                        return InkWell(
                          onTap: () => PaymentDialogBox.show(context),
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor: Colors.green,
                                  child: CircleAvatar(radius: 30, backgroundImage: NetworkImage(user.picture.thumbnail),),
                                ),
                                const SizedBox(height: 8),
                                Text(user.name.first, style: text),
                              ],
                            ),
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
                      String character = String.fromCharCode('A'.codeUnitAt(0) + index);
                      return Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5, bottom: 12),
                        child: Container(
                          height: 5,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(246, 232, 228, 228),
                                offset: Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              character,
                               style: charactortext, // You need to define this style
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
          const SizedBox(height: 16),
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
