import 'package:flora/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Center(
        child: Text('Chat Page'),
      ),
    );
  }
}
