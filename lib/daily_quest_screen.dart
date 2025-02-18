import 'dart:async';

import 'package:flutter/material.dart';
import 'models.dart';
import 'user.dart';
import 'main_screen.dart'; // Import MainScreen
import 'challenge_screen.dart'; // Import ChallengeScreen

class DailyQuestScreen extends StatefulWidget {
  final User user;
  final List<DailyQuest> quests;

  const DailyQuestScreen({super.key, required this.user, required this.quests});

  @override
  _DailyQuestScreenState createState() => _DailyQuestScreenState();
}

class _DailyQuestScreenState extends State<DailyQuestScreen> {
  final TextEditingController pushupsController = TextEditingController();
  final TextEditingController situpsController = TextEditingController();
  final TextEditingController chinupsController = TextEditingController();
  final TextEditingController runningController = TextEditingController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startDailyResetTimer();
  }

  @override
  void dispose() {
    pushupsController.dispose();
    situpsController.dispose();
    chinupsController.dispose();
    runningController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startDailyResetTimer() {
    _timer = Timer.periodic(Duration(hours: 24), (timer) {
      setState(() {
        for (var quest in widget.quests) {
          quest.progress = 0;
        }
      });
      widget.user.saveUserData(); // Save user data after resetting
    });
  }

  void completeQuest(DailyQuest quest) {
    setState(() {
      if (!quest.isComplete()) {
        quest.progress = quest.goal;
        widget.user.addXP(10); // Add 10 XP for completing the quest
        widget.user.saveUserData(); // Save user data
      }
    });
  }

  void _addSet(String exercise, TextEditingController controller) {
    int count =
        controller.text.isNotEmpty
            ? int.parse(controller.text)
            : 0; // Prevent crash on empty input
    setState(() {
      DailyQuest quest = widget.quests.firstWhere(
        (quest) => quest.name == exercise,
      );
      quest.progress += count;

      if (exercise == 'Push-ups' && quest.progress >= 100) {
        widget.user.addXP(10);
        quest.progress = 100; // Cap progress at 100
      } else if (exercise == 'Sit-ups' && quest.progress >= 100) {
        widget.user.addXP(10);
        quest.progress = 100;
      } else if (exercise == 'Chin-ups' && quest.progress >= 50) {
        widget.user.addXP(10);
        quest.progress = 50;
      } else if (exercise == 'Running' && quest.progress >= 1) {
        widget.user.addXP(10);
        quest.progress = 1;
      }

      widget.user.saveUserData(); // Save user data
    });

    controller.clear();
  }

  Widget _buildAddSetRow(String exercise, TextEditingController controller) {
    return ListTile(
      title: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Add $exercise set",
          labelStyle: TextStyle(color: Colors.cyanAccent), // Glowing label
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.add, color: Colors.cyanAccent), // Glowing icon
        onPressed: () => _addSet(exercise, controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daily Quests",
          style: TextStyle(
            color: Colors.lightBlueAccent, // Glowing effect for headers
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "XP: ${widget.user.xp}",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ...widget.quests.map((quest) {
            return ListTile(
              title: Text(
                "${quest.name}: ${quest.progress}/${quest.goal}",
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
              trailing: IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.cyanAccent,
                ), // Glowing icon
                onPressed: () => completeQuest(quest),
              ),
            );
          }),
          _buildAddSetRow("Push-ups", pushupsController),
          _buildAddSetRow("Sit-ups", situpsController),
          _buildAddSetRow("Chin-ups", chinupsController),
          _buildAddSetRow("Running", runningController),
          ListTile(
            title: Text(
              "Back to Main Screen",
              style: TextStyle(
                color: Colors.cyanAccent,
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
            trailing: Icon(
              Icons.arrow_back,
              color: Colors.cyanAccent,
            ), // Glowing icon
            onTap: () {
              Navigator.pop(context); // Navigate back to the main screen
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1C1C1C),
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: 1, // Highlight "Quests"
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
              // Do nothing, already on the DailyQuestScreen
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ChallengeScreen(
                        user: widget.user,
                        challenge: widget.user.challenges.first,
                      ),
                ),
              ); // Navigate to ChallengeScreen
              break;
          }
        },
      ),
    );
  }
}
