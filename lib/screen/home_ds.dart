import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sidebarx/sidebarx.dart';

import 'main_page.dart';

class HomeDsPage extends StatelessWidget {
  const HomeDsPage({super.key, required this.controller});

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Revennue', style: theme.textTheme.titleMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('44500', style: theme.textTheme.titleMedium),
                      //  Container(
                      //   width: MediaQuery.of(context).size.width * 0.1,
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //     color: Theme.of(context).canvasColor,
                      //   ),
                      //  )
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).canvasColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search',
                            prefixIcon: Icon(
                              Icons.search,
                              color: theme.iconTheme.color,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        spacing: 15,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(LucideIcons.messageCircle),
                            color: Color(0xFFFFD54F),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(LucideIcons.bell),
                            color: Color(0xFFFFD54F),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1502685104226-1c2b0f8d3a4e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          default:
            return Text(pageTitle, style: theme.textTheme.headlineSmall);
        }
      },
    );
  }
}
