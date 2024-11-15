import 'package:admin_fur_care/core/theme/app_color.dart';
import 'package:admin_fur_care/features/adaption/presentation/admin_pet_list_screen.dart';
import 'package:admin_fur_care/features/auth/profile/presentation/profile_screen.dart';
import 'package:admin_fur_care/features/incident/presentation/admin_incident_screen.dart';
import 'package:admin_fur_care/features/users/presentation/user_detail_screen.dart';
import 'package:admin_fur_care/features/vet/presentation/admin_vet_list_screen.dart';
import 'package:flutter/material.dart';

class AdminPetBottomNavigationBar extends StatefulWidget {
  const AdminPetBottomNavigationBar({super.key});

  @override
  State<AdminPetBottomNavigationBar> createState() =>
      _AdminPetBottomNavigationBarState();
}

class _AdminPetBottomNavigationBarState
    extends State<AdminPetBottomNavigationBar> {
  int currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onNavBarTap(int index) {
    setState(() {
      currentPageIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: const <Widget>[
          AdminUserDetail(),
          AdminPetAdaptionList(),
          AdminPetAdaptionList(),
          AdminIncidentScreen(),
          AdminVetListScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: onNavBarTap,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColor.selectedDropDown,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Adaption',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart_sharp),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Incident',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information),
            label: 'Vets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
        ],
      ),
    );
  }
}
