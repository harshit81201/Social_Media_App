import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: const SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Icon(
              Icons.person,
              size: 100,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}