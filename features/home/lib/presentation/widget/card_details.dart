import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://api.lorem.space/image/face?w=640&h=480&r=867'),
            ),
            const SizedBox(height: 16),
            Text(
             ' userData["name"]',
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Email: ${["email"]}"),
            Text("Password: ${["password"]}"),
            Text("Role: ${["role"]}"),
          ],
        ),
      ),
    );
  }
}
