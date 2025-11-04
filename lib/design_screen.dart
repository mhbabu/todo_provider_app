import 'package:flutter/material.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({super.key});

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Desin Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 10, 61),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // 👈 This fixes the arrow color
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.deepOrange,
              ),

              child: ListTile(
                title: const Text('Mahadi Hassan Babu'),
                subtitle: const Text('Software Engineer'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                leading: Icon(Icons.account_circle_rounded, size: 30),
                iconColor: Colors.white,
                textColor: Colors.white,
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.indigo,
              ),

              child: ListTile(
                title: const Text('Mahadi Hassan Babu'),
                subtitle: const Text('Software Engineer'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                leading: Icon(Icons.account_circle_rounded, size: 30),
                iconColor: Colors.white,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
