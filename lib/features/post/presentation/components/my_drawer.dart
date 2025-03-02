import 'package:flutter/material.dart';
import 'package:social_media_app/features/post/presentation/components/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Icon(
              Icons.person,
              size: 100,
              color: Colors.grey,
            ),

            //home tile
            MyDrawerTile(
              title: 'H O M E',
              icon: Icons.home,
              onTap: () {},
            ),


            //profile tile


            //search tile


            //settings tile


            //logout tile
          ],
        ),
      ),
    );
  }
}