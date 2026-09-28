import 'package:flutter/material.dart';
import 'package:task_app_screen/core/routes/app_routes.dart';
import 'package:task_app_screen/features/tasks/presentation/views/screens/task_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.tasks:
        return MaterialPageRoute(builder: (context) => const TaskScreen(),); 
       default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}