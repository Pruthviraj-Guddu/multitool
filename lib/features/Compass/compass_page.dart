import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:multitool/features/Compass/neu_circle.dart';
import 'package:multitool/widgets/bottom_nav_bar.dart';
import 'package:permission_handler/permission_handler.dart';

class CompassPage extends StatefulWidget {
  const CompassPage({super.key});

  @override
  State<CompassPage> createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  bool _hasPermissions = false;

  @override
  void initState() {
    super.initState();
    _fetchPermissionStatus();
  }

  void _fetchPermissionStatus() async {
    final status = await Permission.locationWhenInUse.status;
    if (mounted) {
      setState(() {
        _hasPermissions = status == PermissionStatus.granted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: const Text('Compass'),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     if (context.canPop()) {
        //       context.pop();
        //     } else {
        //       context.go(Routes.home);
        //     }
        //   },
        // ),
      ),
        //backgroundColor: const  //const Color.fromARGB(255, 255, 255, 255),
        body: Builder(
          builder: (context) {
            if (_hasPermissions) {
              return _buildCompass();
            } else {
              return _buildPermissionSheet();
            }
          },
        ),
        bottomNavigationBar: const AppBottomNavBar(currentIndex: 1),
      ),
      
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;

        if (direction == null) {
          return const Center(
            child: Text("Device does not have sensors!"),
          );
        }

        return NeuCircle(
          child: Transform.rotate(
            angle: (direction * (math.pi / 180) * -1),

            child: Image.asset(
              'assets/images/compass.png',
              // height: 200.widthMultiplier,
              // width: 200.widthMultiplier,
              color: const Color.fromARGB(255, 0, 0, 0),
              fit: BoxFit.fill,
              
            ),
          ),
        );
      },
    );
  }

  Widget _buildPermissionSheet() {
    return Center(
      child: ElevatedButton(
        child: const Text('Request Permissions'),
        onPressed: () async {
          await Permission.locationWhenInUse.request();
          _fetchPermissionStatus();
        },
      ),
    );
  }
}