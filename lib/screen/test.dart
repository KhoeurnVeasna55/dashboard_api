// import 'package:flutter/material.dart';
// import 'package:sidebarx/sidebarx.dart';


// class SidebarXExampleApp extends StatelessWidget {
//   SidebarXExampleApp({super.key});

//   final _controller = SidebarXController(selectedIndex: 0, extended: true);
//   final _key = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SidebarX Example',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: primaryColor,
//         canvasColor: canvasColor,
//         scaffoldBackgroundColor: scaffoldBackgroundColor,
//         textTheme: const TextTheme(
//           headlineSmall: TextStyle(
//             color: Colors.white,
//             fontSize: 46,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//       ),
//       home: Builder(
//         builder: (context) {
//           final isSmallScreen = MediaQuery.of(context).size.width < 600;
//           return Scaffold(
//             key: _key,
//             appBar: isSmallScreen
//                 ? AppBar(
//                     backgroundColor: canvasColor,
//                     title: Text(_getTitleByIndex(_controller.selectedIndex)),
//                     leading: IconButton(
//                       onPressed: () {
//                         // if (!Platform.isAndroid && !Platform.isIOS) {
//                         //   _controller.setExtended(true);
//                         // }
//                         _key.currentState?.openDrawer();
//                       },
//                       icon: const Icon(Icons.menu),
//                     ),
//                   )
//                 : null,
//             drawer: ExampleSidebarX(controller: _controller),
//             body: Row(
//               children: [
//                 if (!isSmallScreen) ExampleSidebarX(controller: _controller),
//                 Expanded(
//                   child: Center(
//                     child: _ScreensExample(
//                       controller: _controller,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ExampleSidebarX extends StatelessWidget {
//   const ExampleSidebarX({
//     super.key,
//     required SidebarXController controller,
//   })  : _controller = controller;

//   final SidebarXController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return SidebarX(
//       controller: _controller,
//       theme: SidebarXTheme(
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: canvasColor,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         hoverColor: scaffoldBackgroundColor,
//         textStyle: TextStyle(color: Colors.white.withValues(alpha:  0.7)),
//         selectedTextStyle: const TextStyle(color: Colors.white),
//         hoverTextStyle: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//         ),
//         itemTextPadding: const EdgeInsets.only(left: 30),
//         selectedItemTextPadding: const EdgeInsets.only(left: 30),
//         itemDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: canvasColor),
//         ),
//         selectedItemDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: actionColor.withValues(alpha:  0.37),
//           ),
//           color: accentCanvasColor,
//           boxShadow: [
//             BoxShadow(
//               color: Color(0xFF272651).withValues(alpha:  0.28),
//               blurRadius: 30,
//             )
//           ],
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.white.withValues(alpha:  0.7),
//           size: 20,
//         ),
//         selectedIconTheme: const IconThemeData(
//           color: Colors.white,
//           size: 20,
//         ),
//       ),
//       extendedTheme: const SidebarXTheme(
//         width: 200,
//         decoration: BoxDecoration(
//           color: canvasColor,
//         ),
//       ),
//       footerDivider: divider,
//       headerBuilder: (context, extended) {
//         return SizedBox(
//           height: 100,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             // child: Image.asset('assets/images/avatar.png'),
//           ),
//         );
//       },
//       items: [
//         SidebarXItem(
//           icon: Icons.home,
//           label: 'Home',
//           onTap: () {
//             debugPrint('Home');
//           },
//         ),
//         const SidebarXItem(
//           icon: Icons.search,
//           label: 'Search',
//         ),
//         const SidebarXItem(
//           icon: Icons.people,
//           label: 'People',
//         ),
//         SidebarXItem(
//           icon: Icons.favorite,
//           label: 'Favorites',
//           selectable: false,
//           onTap: () => _showDisabledAlert(context),
//         ),
//         SidebarXItem(
//           iconBuilder: (context) => const FlutterLogo(size: 20),
//           label: 'Flutter',
//         ),
//       ],
//     );
//   }

//   void _showDisabledAlert(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text(
//           'Item disabled for selecting',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//       ),
//     );
//   }
// }

// class _ScreensExample extends StatelessWidget {
//   const _ScreensExample({
//     required this.controller,
//   });

//   final SidebarXController controller;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         final pageTitle = _getTitleByIndex(controller.selectedIndex);
//         switch (controller.selectedIndex) {
//           case 0:
//             return ListView.builder(
//               padding: const EdgeInsets.only(top: 10),
//               itemBuilder: (context, index) => Container(
//                 height: 100,
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Theme.of(context).canvasColor,
//                   boxShadow: const [BoxShadow()],
//                 ),
//               ),
//             );
//           default:
//             return Text(
//               pageTitle,
//               style: theme.textTheme.headlineSmall,
//             );
//         }
//       },
//     );
//   }
// }

// String _getTitleByIndex(int index) {
//   switch (index) {
//     case 0:
//       return 'Home';
//     case 1:
//       return 'Search';
//     case 2:
//       return 'People';
//     case 3:
//       return 'Favorites';
//     case 4:
//       return 'Custom iconWidget';
//     case 5:
//       return 'Profile';
//     case 6:
//       return 'Settings';
//     default:
//       return 'Not found page';
//   }
// }

// const primaryColor = Color(0xFF685BFF);
// const canvasColor = Color(0xFF2E2E48);
// const scaffoldBackgroundColor = Color(0xFF464667);
// const accentCanvasColor = Color(0xFFFFCF00);
// const white = Colors.white;
// final actionColor = const Color(0xFFFFCF00).withValues(alpha:  0.6);
// final divider = Divider(color: white.withValues(alpha:  0.3), height: 1);