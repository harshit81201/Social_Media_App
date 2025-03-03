import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_app/features/home/presentation/components/my_drawer_tile.dart';

import '../../../profile/presentation/pages/profile_pages.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              //profile image
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.grey,
                ),
              ),

              //divider line
              Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
          
              //home tile
              MyDrawerTile(
                title: 'H O M E',
                icon: Icons.home_outlined,
                onTap: () => Navigator.of(context).pop(),
              ),
          
          
              //profile tile
              MyDrawerTile(
                title: 'P R O F I L E',
                icon: Icons.person_2_outlined,
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                },   
              ),
          
          
              //search tile
              MyDrawerTile(
                title: 'S E A R C H',
                icon: Icons.search_outlined,
                onTap: () {},
              ),
          
          
              //settings tile
              MyDrawerTile(
                title: 'S E T T I N G S',
                icon: Icons.settings_outlined,
                onTap: () {},
              ),

              const Spacer(),          
          
              //logout tile
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0), // Adjust the value as needed
                child: MyDrawerTile(
                  title: 'L O G O U T',
                  icon: Icons.logout_outlined,
                  onTap: () => context.read<AuthCubit>().logout(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}