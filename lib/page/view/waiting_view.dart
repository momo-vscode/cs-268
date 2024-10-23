import 'package:flutter/material.dart';

class WaitingView extends StatelessWidget {
  const WaitingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BookClub"), centerTitle: true),
      body: const Center(
        child:
            SizedBox(height: 50, width: 50, child: CircularProgressIndicator()),
      ),
    );
  }
}
