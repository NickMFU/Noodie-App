import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noodie_1/model/Work.dart'; // Import the Work model

class CreateWorkPage extends StatefulWidget {
  @override
  _CreateWorkPageState createState() => _CreateWorkPageState();
}

class _CreateWorkPageState extends State<CreateWorkPage> {
  final TextEditingController _consigneeController = TextEditingController();
  final TextEditingController _vesselController = TextEditingController();
  final TextEditingController _voyController = TextEditingController();
  final TextEditingController _blNoController = TextEditingController();
  final TextEditingController _shippingController = TextEditingController();
  final TextEditingController _responsiblePersonController =
      TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  // Other necessary controllers for collecting data

  // Function to save the work to Firestore
  Future<void> _saveWorkToFirestore() async {
    try {
      // Create a new instance of the Work model with the collected data
      Work newWork = Work(
        workID: FirebaseFirestore.instance.collection('works').doc().id,
        date: DateTime.now().toString(),
        consignee: _consigneeController.text,
        vessel: _vesselController.text,
        voy: _voyController.text,
        blNo: _blNoController.text,
        shipping: _shippingController.text,
        estimatedCompletionTime: null, // Add your logic to collect estimated completion time
        employeeId: 'employee_id', // Add logic to collect employee ID
        responsiblePerson: _responsiblePersonController.text,
        imageUrl: _imageUrlController.text,
        statuses: [], // Initialize with an empty list of statuses
      );

      // Save the work data to Firestore
      await FirebaseFirestore.instance
          .collection('works')
          .doc(newWork.workID)
          .set(newWork.toMap());

      // Show a success message or navigate to another page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Work created successfully!'),
        ),
      );
    } catch (e) {
      // Handle errors
      print('Error saving work: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create work. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Work'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _consigneeController,
              decoration: InputDecoration(labelText: 'Consignee'),
            ),
            TextField(
              controller: _vesselController,
              decoration: InputDecoration(labelText: 'Vessel'),
            ),
            TextField(
              controller: _voyController,
              decoration: InputDecoration(labelText: 'Voy'),
            ),
            TextField(
              controller: _blNoController,
              decoration: InputDecoration(labelText: 'BL No'),
            ),
            TextField(
              controller: _shippingController,
              decoration: InputDecoration(labelText: 'Shipping'),
            ),
            TextField(
              controller: _responsiblePersonController,
              decoration: InputDecoration(labelText: 'Responsible Person'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            // Add more text fields to collect other data
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveWorkToFirestore,
              child: Text('Create Work'),
            ),
          ],
        ),
      ),
    );
  }
}