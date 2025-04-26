import 'package:example_getx/controller/example_conrtoller.dart';
import 'package:example_getx/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ExampleConrtoller exampleConrtoller = Get.put(ExampleConrtoller());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("Example Getx", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notification"),
                  Obx(() {
                    return Switch(
                      value: exampleConrtoller.notification.value,
                      onChanged: (value) {
                        exampleConrtoller.setNotifications(value);
                      },
                    );
                  }),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: favoriteController.fruitList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            if (favoriteController.favoriteFruitArray.contains(
                              favoriteController.fruitList[index],
                            )) {
                              favoriteController.removeFromFavorite(
                                favoriteController.fruitList[index],
                              );
                            } else {
                              favoriteController.addToFavorite(
                                favoriteController.fruitList[index],
                              );
                            }
                          },
                          title: Text(
                            favoriteController.fruitList[index],
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: Obx(() {
                            return Icon(
                              Icons.favorite,
                              color:
                                  favoriteController.favoriteFruitArray
                                          .contains(
                                            favoriteController.fruitList[index],
                                          )
                                      ? Colors.red
                                      : Colors.white,
                            );
                          }),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
