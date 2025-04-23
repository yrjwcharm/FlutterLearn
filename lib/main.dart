import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 240,
            child: Image.asset('web/icons/Icon-192.png', fit: BoxFit.cover),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        location,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.star),
                  color: Colors.red[500],
                  onPressed: () {
                    // Handle the button press
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Icon(Icons.phone, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Phone: +41 123 456 789',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Icon(Icons.web, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Website: www.example.com',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Icon(Icons.access_time, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Open: 9 AM - 5 PM',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Icon(Icons.directions, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Directions: 123 Main St, Kandersteg',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Icon(Icons.accessibility, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Accessibility: Wheelchair accessible',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Icon(Icons.pets, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Pets: Allowed',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Icon(Icons.local_parking, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Parking: Available',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Icon(Icons.restaurant, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Restaurant: On-site',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Icon(Icons.local_activity, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Activities: Hiking, Swimming',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                const Icon(Icons.info, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Info: Open year-round',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Layout Demo')),
        body: const Center(
          child: TitleSection(
            name: 'Oeschinen Lake Campground',
            location: 'Kandersteg, Switzerland',
          ),
        ),
      ),
    ),
  );
}
