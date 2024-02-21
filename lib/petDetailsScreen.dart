import 'package:flutter/material.dart';
import 'package:openapi/src/model/pet.dart';

class PetDetailsScreen extends StatelessWidget {
  final Pet pet;

  const PetDetailsScreen({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${pet.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'ID: ${pet.id}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${pet.status}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Category: ${pet.category?.name ?? "N/A"}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tags:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            // Displaying the tags
            for (var tag in pet.tags!) Text(tag.name ?? ""),
            const SizedBox(height: 8),
            const Text(
              'Photo URLs:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            // Displaying the photo URLs
            for (var url in pet.photoUrls) Text(url),
          ],
        ),
      ),
    );
  }
}
