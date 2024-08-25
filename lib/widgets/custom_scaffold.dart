import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.newChild, this.bgColor});
  final Widget? newChild;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: newChild!,
          )
        ],
      ),
    );
  }
}
