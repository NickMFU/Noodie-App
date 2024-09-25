import 'package:flutter/material.dart';
import 'package:noodie_1/Component/bottom_nav.dart';
import 'package:noodie_1/screen/creatework.dart';
import 'package:noodie_1/screen/notification.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement action for total button
              },
              child: Text('Total'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement action for complete button
              },
              child: Text('Complete'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement action for on-progress button
              },
              child: Text('On Progress'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement action for cancel button
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
       bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Set the initial index of the selected item
        onTap: (index) {
          // Handle navigation when an item is tapped
          // Example:
          if (index == 0) {
            // Navigate to the home page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateWorkPage()),
            );
          } else if (index == 1) {
            // Navigate to the notifications page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationPage()),
            );
          } else if (index == 2) {
            // Handle the action for the 'CreateWork' item
            // You can define the action based on your requirements
          }
        },
      ),
    );
  }
}
  