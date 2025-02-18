import 'package:flutter/material.dart';
import 'package:sololeveling/challenge.dart';
import 'daily_quest_screen.dart';
// ignore: unused_import
import 'models.dart';
import 'user.dart';
import 'main_screen.dart'; // Import MainScreen
import 'dart:async';

class ChallengeScreen extends StatefulWidget {
  final User user;
  final Challenge challenge;

  const ChallengeScreen({
    super.key,
    required this.user,
    required this.challenge,
  });

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  late Timer _timer;
  Duration _timeRemaining = Duration(minutes: 10); // Example duration

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining.inSeconds > 0) {
          _timeRemaining -= Duration(seconds: 1);
        } else {
          _timer.cancel();
          _showChallengeExpired();
        }
      });
    });
  }

  void _showChallengeExpired() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "You Ignored the Challenge!",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.redAccent,
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
          content: Text(
            "You had a chance to earn ${widget.challenge.rewardXP} XP, but you let it slip away! Next challenge appears in 2 days.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Return to MainScreen
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _completeChallenge() {
    setState(() {
      widget.user.addXP(widget.challenge.rewardXP);
      widget.user.saveUserData(); // Save user data
    });

    _showCompletionAnimation();
  }

  void _showCompletionAnimation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Challenge Complete!",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.blueAccent,
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
          content: Text("You have earned ${widget.challenge.rewardXP} XP!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(user: widget.user),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bonus Challenge Available!",
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.blueAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Challenge Name: ${widget.challenge.description}",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.blueAccent,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Category: ${widget.challenge.category}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "XP Reward: ${widget.challenge.rewardXP}",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.blueAccent,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Challenge Expires In: ${_timeRemaining.inMinutes}:${(_timeRemaining.inSeconds % 60).toString().padLeft(2, '0')}",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.redAccent,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: _completeChallenge,
              child: Text("Complete Challenge"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1C1C1C),
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Highlight "Challenges"
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Quests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Challenges',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(user: widget.user),
                ),
              ); // Navigate to MainScreen
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          DailyQuestScreen(user: widget.user, quests: []),
                ),
              ); // Navigate to DailyQuestScreen
              break;
            case 2:
              // Do nothing, already on the ChallengeScreen
              break;
          }
        },
      ),
    );
  }
}
