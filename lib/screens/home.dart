import 'package:flutter/material.dart';
import 'package:login_page/screens/chat_screen.dart';
import 'package:login_page/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key});

  @override
  Widget build(BuildContext context) {
    var time = 0;

  List<String> names = [
  'Aarav',
  'Akshay',
  'Aditi',
  'Amit',
  'Anjali',
  'Arya',
  'Bhavya',
  'Chetan',
  'Deepika',
  'Dhruv',
  'Divya',
  'Gaurav',
  'Ishita',
  'Kavita',
  'Krishna',
  'Mehak',
  'Neha',
  'Preeti',
  'Rahul',
  'Rajesh',
  'Riya',
  'Sanjay',
  'Sarita',
  'Shreya',
  'Suresh',
  'Tanvi',
  'Uma',
  'Varun',
  'Vidya',
  'Vivek',
];
  List<String> messages = [
      'Hello!',
      'Good morning!',
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () {
                _showPopupDialog(context);
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (ctx, index) {
            time++;
            int count = index % names.length;
            int messageCount = index % messages.length;
            if (index == 9 || index == 13 || index == 17 || index == 26) {
              time = 1;
            }
            return GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg?w=740',
                  ),
                  radius: 35,
                ),
                title: Text(names[count]),
                subtitle: Text(messages[messageCount]),
                trailing: Text('$time : 00 PM'),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: 27,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_comment),
        ),
      ),
    );
  }

  void _showPopupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Logout Confirmation',
            style: TextStyle(fontSize: 27.5),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(fontSize: 17),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                _signout(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _signout(BuildContext ctx) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => const ScreenLogin()),
      (route) => false,
    );
  }
}
