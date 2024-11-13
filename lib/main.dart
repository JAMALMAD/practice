import 'package:data_save/core/app_route.dart';
import 'package:data_save/core/dependency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('country-list');
  box.put('name', 'Bangladesh');
  print(box.get('name'));
  DependencyInjection di = DependencyInjection();
  di.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Approute.homeScreen,
      getPages: Approute.getPage,
    );
  }
}
