import 'package:flutter/material.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Offers',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
