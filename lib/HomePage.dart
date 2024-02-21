import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_open_api/petDetailsScreen.dart';
import 'package:openapi/petstore_api.dart';

enum PetStatus { available, notAvailable }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.petApi})
      : super(key: key);

  final String title;
  final PetApi petApi;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BuildContext _context;
  TextEditingController petId = TextEditingController();
  TextEditingController addPetId = TextEditingController();
  TextEditingController petName = TextEditingController();

  void updatePet() async {
    try {
      PetBuilder petBuilder = PetBuilder();
      petBuilder.id = int.parse(addPetId.text.toString());
      petBuilder.name = petName.text.toString();
      petBuilder.status =
          PetStatusEnum.available; // Convert string to PetStatusEnum
      Pet pet = petBuilder.build();

      await widget.petApi.updatePet(pet: pet);

      showCustomSnackbar("Pet updated Successfully");
    } catch (e) {
      log("Error updating pet: $e");
      showCustomSnackbar("Failed to update pet");
    }
  }

  void loadData() async {
    try {
      final petResponse = await widget.petApi
          .getPetById(petId: int.parse(petId.text.toString()));
      if (petResponse.data != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => PetDetailsScreen(pet: petResponse.data!),
          ),
        );
      } else {
        log("Error: Null response received from server");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        showCustomSnackbar(e.response!.data["message"]);
        // print("Server error: ${e.response!.data["message"]}");
      } else {
        showCustomSnackbar(e.message!);
        log("Network error: ${e.message}");
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Builder(
        builder: (context) {
          _context = context;
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Search Pet by ID: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: petId,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Pet ID",
                  ),
                ),
                const SizedBox(height: 15),
                buildButton("Search Pet", loadData),
                const SizedBox(height: 15),
                const Text(
                  "Add Pet Details: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: addPetId,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Pet ID",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: petName,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Pet Name",
                  ),
                ),
                const SizedBox(height: 15),
                buildButton("Add Pet", updatePet),
                const SizedBox(height: 15),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildButton(String label, void Function() onPressed) {
    return InkWell(
      onTap: () {
        FocusScope.of(_context).unfocus();
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void showCustomSnackbar(String message,
      {Duration duration = const Duration(seconds: 2)}) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: duration,
    );
    ScaffoldMessenger.of(_context).showSnackBar(snackbar);
  }
}
