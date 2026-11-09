import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? buttontext;
  final VoidCallback? onPressed;
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.buttontext,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //icon
          Icon(icon, size: 65, color: Colors.grey),
          const SizedBox(height: 16),
          // title
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),
          //message
          Text(message, style: GoogleFonts.poppins(fontSize: 16)),

          const SizedBox(height: 24),

          //button
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttontext ?? 'Get Started',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
