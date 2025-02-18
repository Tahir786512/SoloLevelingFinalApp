// ignore_for_file: unused_import, unnecessary_import

import 'package:flutter/material.dart';
import 'challenge.dart' as fitness_challenge;
import 'package:flutter/animation.dart';
import 'dart:async';
import 'challenge_screen.dart';
import 'daily_quest_screen.dart';
import 'user.dart';
import 'models.dart';
import 'title.dart' as fitness_title;

class MainScreen extends StatefulWidget {
  final User user;

  const MainScreen({super.key, required this.user});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  List<DailyQuest> quests = [
    DailyQuest(name: "Push-ups", goal: 100),
    DailyQuest(name: "Sit-ups", goal: 100),
    DailyQuest(name: "Chin-ups", goal: 50),
    DailyQuest(name: "Running", goal: 1),
  ];

  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);
    updateUserTitle();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void updateUserTitle() {
    fitness_title.Title? currentTitle;
    for (fitness_title.Title title in fitness_title.titles) {
      if (widget.user.level >= title.level) {
        currentTitle = title;
      } else {
        break;
      }
    }
    setState(() {
      widget.user.title = currentTitle?.title ?? "Beginner";
    });
  }

  bool isChallengeAvailable() {
    for (fitness_challenge.Challenge challenge
        in fitness_challenge.challenges) {
      if (widget.user.level >= challenge.unlockLevel &&
          widget.user.level < challenge.unlockLevel + 5) {
        return true;
      }
    }
    return false;
  }

  fitness_challenge.Challenge getAvailableChallenge() {
    for (fitness_challenge.Challenge challenge
        in fitness_challenge.challenges) {
      if (widget.user.level >= challenge.unlockLevel &&
          widget.user.level < challenge.unlockLevel + 5) {
        return challenge;
      }
    }
    // Return a default challenge if none are found
    return fitness_challenge.challenges.first;
  }

  void acceptChallenge(fitness_challenge.Challenge challenge) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                ChallengeScreen(user: widget.user, challenge: challenge),
      ),
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    bool challengeAvailable = isChallengeAvailable();
    fitness_challenge.Challenge availableChallenge = getAvailableChallenge();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Solo Leveling Fitness",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "XP: ${widget.user.xp}",
              style: TextStyle(
                fontSize: 24,
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Level: ${widget.user.level}",
              style: TextStyle(
                fontSize: 24,
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Title: ${widget.user.title}",
              style: TextStyle(
                fontSize: 24,
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
          ),
          ListTile(
            title: Text(
              "Daily Quests",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 22,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.blueAccent,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.lightBlueAccent,
              size: 30,
            ),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          DailyQuestScreen(user: widget.user, quests: quests),
                ),
              );
              setState(() {});
            },
          ),
          _buildChallengeButton(challengeAvailable, availableChallenge),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1C1C1C),
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Highlight "Home"
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
              // Already on MainScreen
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          DailyQuestScreen(user: widget.user, quests: quests),
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ChallengeScreen(
                        user: widget.user,
                        challenge: availableChallenge,
                      ),
                ),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildChallengeButton(
    bool challengeAvailable,
    fitness_challenge.Challenge availableChallenge,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          if (challengeAvailable) {
            acceptChallenge(availableChallenge);
          } else {
            showMessage("Keep Training! Challenges Await You Soon.");
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: challengeAvailable ? Colors.black54 : Colors.black38,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color:
                    challengeAvailable
                        ? Colors.blue.withOpacity(0.7)
                        : Colors.blue.withOpacity(0.3),
                blurRadius: 10.0,
                spreadRadius: challengeAvailable ? 3.0 : 1.0,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              challengeAvailable
                  ? AnimatedBuilder(
                    animation: _animation!,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _animation!.value,
                        child: Icon(
                          Icons.local_fire_department,
                          color: Colors.blue,
                          size: 30,
                        ),
                      );
                    },
                  )
                  : Icon(
                    Icons.local_fire_department,
                    color: Colors.blueGrey,
                    size: 30,
                  ),
              SizedBox(width: 10),
              Text(
                challengeAvailable
                    ? "New Challenge Available!"
                    : "No Challenge Yet",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 18,
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
            ],
          ),
        ),
      ),
    );
  }
}
