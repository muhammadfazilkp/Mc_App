import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_applicaton/home/model/visitors_model.dart';
import 'package:mc_applicaton/home/view/splash_screen/splash.dart';
import 'package:mc_applicaton/home/viewmodel/getuser_provider/getuser.dart';
import 'package:mc_applicaton/home/viewmodel/services/hive_adapter.dart';
import 'package:provider/provider.dart';
import 'home/viewmodel/visitors_provider/get_visitorsdata.dart';

void main() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CustomNoteAdapter().typeId)) {
    Hive.registerAdapter(CustomNoteAdapter());
  }

  await Hive.openBox<Visitors>('visitor');
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetUserProvider()),
        ChangeNotifierProvider(create: (context)=>GetvisitorsData())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
