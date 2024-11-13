
import 'package:data_save/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              TextFormField(
                controller: authController.textController.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final userData = authController.textController.value.text;
                  authController.countryBox!.add(userData);
                  authController.textController.value.clear();
                },
                child: Text("Add Data"),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box("country-list").listenable(),
                  builder: (context, box, widget) {
                    return ListView.builder(
                      itemCount: box.length, // Use box.length instead of .keys
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(box.getAt(index).toString()),
                            trailing: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit_outlined),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove_outlined),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
