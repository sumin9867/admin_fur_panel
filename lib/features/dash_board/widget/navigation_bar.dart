import 'package:admin_fur_care/features/vet/presentation/add_vet_screen.dart';
import 'package:flutter/material.dart';
import 'package:admin_fur_care/features/adaption/presentation/admin_add_pet_screen.dart';
import 'package:admin_fur_care/features/dash_board/dash_board.screen.dart';
import 'package:gap/gap.dart';

class AdminNavigationBar extends StatefulWidget {
  const AdminNavigationBar({super.key});

  @override
  State<AdminNavigationBar> createState() => _AdminNavigationBarState();
}

class _AdminNavigationBarState extends State<AdminNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MyWidget(),

    AddPetScreen(), // Replace with your actual screen widget
    AddVetScreen(), // Replace with actual screen widget for "Users"
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: NavigationRail(
              selectedIndex: _selectedIndex,
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: _onDestinationSelected,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.pets_sharp),
                  selectedIcon: Icon(Icons.pets),
                  label: Text('Add Adoption'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.local_hospital_outlined),
                  selectedIcon: Icon(Icons.local_hospital),
                  label: Text('Incidents'),
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ],
      ),
    );
  }
}
