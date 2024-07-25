// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:pet_care_app/core/widget/app_router.dart';

// class ScaffoldWithBottomNavBar extends StatefulWidget {
//   final Widget body;
//   const ScaffoldWithBottomNavBar({
//     super.key,
//     required this.body,
//   });

//   @override
//   State<ScaffoldWithBottomNavBar> createState() =>
//       _ScaffoldWithBottomNavBarState();
// }

// class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: widget.body,
//         extendBody: true,
//         bottomNavigationBar: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           decoration: const BoxDecoration(
//             color: Colors.transparent,
//             boxShadow: [
//               BoxShadow(
//                 color: Color.fromRGBO(0, 0, 0, 0.1),
//                 spreadRadius: 4,
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(16),
//             child: BottomNavigationBar(
//               selectedFontSize: 12,
//               enableFeedback: true,
//               type: BottomNavigationBarType.fixed,
//               currentIndex: __calculateSelectedIndex(context),
//               onTap: (value) => _onItemTapped(context, value),
//               items: const [
//                 BottomNavigationBarItem(
//                   activeIcon: Icon(Icons.today),
//                   icon: Icon(Icons.today_outlined),
//                   label: 'Vet',
//                 ),
//                 BottomNavigationBarItem(
//                   activeIcon: Icon(Icons.indeterminate_check_box),
//                   icon: Icon(Icons.indeterminate_check_box_outlined),
//                   label: 'Adaption',
//                 ),
//                 BottomNavigationBarItem(
//                   activeIcon: Icon(Icons.sick_outlined),
//                   icon: Icon(Icons.sick_outlined),
//                   label: 'Report Incident',
//                 ),
//                 BottomNavigationBarItem(
//                   activeIcon: Icon(Icons.person),
//                   icon: Icon(Icons.person_outline_outlined),
//                   label: 'Profile',
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// void _onItemTapped(BuildContext context, int index) {
//   switch (index) {
//     case 0:
//       context.go(AppRoutes.vetScreen);
//       break;
//     case 1:
//       context.go(AppRoutes.pet);
//       break;
//     case 2:
//       context.go(AppRoutes.incident);
//       break;
//     case 3:
//       context.go(AppRoutes.profile);
//       break;
//   }
// }

// int __calculateSelectedIndex(BuildContext context) {
//   final String location;
//   location = GoRouterState.of(context).matchedLocation;
//   if (location.startsWith(AppRoutes.vetScreen)) {
//     return 0;
//   }
//   if (location.startsWith(AppRoutes.pet)) {
//     return 1;
//   }
//   if (location.startsWith(AppRoutes.incident)) {
//     return 2;
//   }
//   if (location.startsWith(AppRoutes.profile)) {
//     return 3;
//   }

//   return 0;
// }
