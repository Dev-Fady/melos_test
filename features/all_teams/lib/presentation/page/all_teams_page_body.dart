import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllTeamsPageBody extends StatelessWidget {
  const AllTeamsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade100, Colors.blue.shade100],
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: 9,
        itemBuilder: (context, index) {
          // final team = teams[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://cdn.sportmonks.com/images/soccer/teams/30/734.png',
                ),
                radius: 30,
              ),
              title: Text(
                'Falkirk',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16),
                      SizedBox(width: 5),
                      Text('تأسس: ${1999}'),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Icon(Icons.sports_soccer, size: 16),
                      SizedBox(width: 5),
                      Text('آخر مباراة: ${2024}'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
