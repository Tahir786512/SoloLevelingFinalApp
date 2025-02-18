class Challenge {
  final String description;
  final int rewardXP;
  final String category;
  final int unlockLevel;

  Challenge({
    required this.description,
    required this.rewardXP,
    required this.category,
    required this.unlockLevel,
  });
}

List<Challenge> challenges = [
  // Levels 1 - 99: Basic Challenges (Unlock Every 5 Levels)
  Challenge(
    description: "20 push-ups",
    rewardXP: 100,
    category: 'Physical',
    unlockLevel: 5,
  ),
  Challenge(
    description: "Read 10 pages of a book",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 10,
  ),
  Challenge(
    description: "No social media for 6 hours",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 15,
  ),
  Challenge(
    description: "1-minute plank",
    rewardXP: 100,
    category: 'Physical',
    unlockLevel: 20,
  ),
  Challenge(
    description: "10 sit-ups for a week",
    rewardXP: 100,
    category: 'Physical',
    unlockLevel: 25,
  ),
  Challenge(
    description: "Solve 3 easy Sudoku puzzles",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 30,
  ),
  Challenge(
    description: "Memorize 5 new words",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 35,
  ),
  Challenge(
    description: "Jump rope for 2 minutes",
    rewardXP: 100,
    category: 'Physical',
    unlockLevel: 40,
  ),
  Challenge(
    description: "Compliment 3 people",
    rewardXP: 100,
    category: 'Personality',
    unlockLevel: 45,
  ),
  Challenge(
    description: "Debate with a friend for 5 minutes",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 50,
  ),
  Challenge(
    description: "30 squats in a row",
    rewardXP: 100,
    category: 'Physical',
    unlockLevel: 55,
  ),
  Challenge(
    description: "Solve a math problem without a calculator",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 60,
  ),
  Challenge(
    description: "Record yourself speaking and analyze your tone",
    rewardXP: 100,
    category: 'Personality',
    unlockLevel: 65,
  ),
  Challenge(
    description: "Sprint 100m in under 15 sec",
    rewardXP: 100,
    category: 'Physical',
    unlockLevel: 70,
  ),
  Challenge(
    description: "Write a letter to your future self",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 75,
  ),
  Challenge(
    description: "Talk to a stranger once a day for 3 days",
    rewardXP: 100,
    category: 'Personality',
    unlockLevel: 80,
  ),
  Challenge(
    description: "No complaining for an entire day",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 85,
  ),
  Challenge(
    description: "Watch a motivational TED Talk",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 90,
  ),
  Challenge(
    description: "Meditate for 5 minutes daily for a week",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 95,
  ),
  Challenge(
    description: "Read for 1 hour straight",
    rewardXP: 100,
    category: 'Mental',
    unlockLevel: 99,
  ),

  // Levels 100 - 299: Intermediate Challenges (Unlock Every 10 Levels)
  Challenge(
    description: "50 push-ups in one session",
    rewardXP: 200,
    category: 'Physical',
    unlockLevel: 110,
  ),
  Challenge(
    description: "Run 2 km without stopping",
    rewardXP: 200,
    category: 'Physical',
    unlockLevel: 120,
  ),
  Challenge(
    description: "Hold a 2-minute plank",
    rewardXP: 200,
    category: 'Physical',
    unlockLevel: 130,
  ),
  Challenge(
    description: "Fast for 24 hours (water only)",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 140,
  ),
  Challenge(
    description: "Memorize 10 foreign words",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 150,
  ),
  Challenge(
    description: "Debate with 3 people for 10 minutes",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 160,
  ),
  Challenge(
    description: "Read and summarize a book in 100 words",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 170,
  ),
  Challenge(
    description: "Organize and lead a small group discussion",
    rewardXP: 200,
    category: 'Personality',
    unlockLevel: 180,
  ),
  Challenge(
    description: "No phone for 12 hours",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 190,
  ),
  Challenge(
    description: "Run 5 km without stopping",
    rewardXP: 200,
    category: 'Physical',
    unlockLevel: 200,
  ),
  Challenge(
    description: "Learn and use 5 idioms in a conversation",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 210,
  ),
  Challenge(
    description: "Solve 5 math problems without a calculator",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 220,
  ),
  Challenge(
    description: "Meditate for 15 minutes daily for a week",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 230,
  ),
  Challenge(
    description: "Complete a 500-piece puzzle",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 240,
  ),
  Challenge(
    description: "Write a blog post on a thought-provoking topic",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 250,
  ),
  Challenge(
    description: "Speak confidently in front of 3+ people",
    rewardXP: 200,
    category: 'Personality',
    unlockLevel: 260,
  ),
  Challenge(
    description: "Make eye contact while talking for an entire conversation",
    rewardXP: 200,
    category: 'Personality',
    unlockLevel: 270,
  ),
  Challenge(
    description: "Read a book for 3 hours straight",
    rewardXP: 200,
    category: 'Mental',
    unlockLevel: 280,
  ),
  Challenge(
    description: "Sprint 200m in under 30 seconds",
    rewardXP: 200,
    category: 'Physical',
    unlockLevel: 290,
  ),

  // Levels 300 - 599: Advanced Challenges (Unlock Every 25 Levels)
  Challenge(
    description: "100 push-ups in one session",
    rewardXP: 300,
    category: 'Physical',
    unlockLevel: 325,
  ),
  Challenge(
    description: "Complete a 1000-rep workout (push-ups, sit-ups, squats)",
    rewardXP: 300,
    category: 'Physical',
    unlockLevel: 350,
  ),
  Challenge(
    description: "Hold a 3-minute plank",
    rewardXP: 300,
    category: 'Physical',
    unlockLevel: 375,
  ),
  Challenge(
    description: "Speak to 5 new people daily for a week",
    rewardXP: 300,
    category: 'Personality',
    unlockLevel: 400,
  ),
  Challenge(
    description: "Read an entire book in one sitting",
    rewardXP: 300,
    category: 'Mental',
    unlockLevel: 425,
  ),
  Challenge(
    description: "Learn and explain a complex scientific concept",
    rewardXP: 300,
    category: 'Mental',
    unlockLevel: 450,
  ),
  Challenge(
    description: "Debate for 15 minutes with 3 different people",
    rewardXP: 300,
    category: 'Mental',
    unlockLevel: 475,
  ),
  Challenge(
    description: "Run 10 km without stopping",
    rewardXP: 300,
    category: 'Physical',
    unlockLevel: 500,
  ),
  Challenge(
    description: "No internet for 24 hours",
    rewardXP: 300,
    category: 'Mental',
    unlockLevel: 525,
  ),
  Challenge(
    description: "Write a 10,000-word essay or story",
    rewardXP: 300,
    category: 'Mental',
    unlockLevel: 550,
  ),
  Challenge(
    description: "Solve 20 complex math problems without a calculator",
    rewardXP: 300,
    category: 'Mental',
    unlockLevel: 575,
  ),

  // Levels 600 - 999: Extreme Challenges (Unlock Every 50 Levels)
  Challenge(
    description: "200 push-ups in one day",
    rewardXP: 400,
    category: 'Physical',
    unlockLevel: 650,
  ),
  Challenge(
    description: "Sprint 200m in under 30 seconds",
    rewardXP: 400,
    category: 'Physical',
    unlockLevel: 700,
  ),
  Challenge(
    description: "Read a book for 5 hours straight",
    rewardXP: 400,
    category: 'Mental',
    unlockLevel: 750,
  ),
  Challenge(
    description: "Fast for 48 hours (only water)",
    rewardXP: 400,
    category: 'Mental',
    unlockLevel: 800,
  ),
  Challenge(
    description: "No phone or internet for 48 hours",
    rewardXP: 400,
    category: 'Mental',
    unlockLevel: 850,
  ),
  Challenge(
    description: "Debate for 30 minutes with 5 different people",
    rewardXP: 400,
    category: 'Mental',
    unlockLevel: 900,
  ),
  Challenge(
    description: "Memorize 50 new foreign words in a week",
    rewardXP: 400,
    category: 'Mental',
    unlockLevel: 950,
  ),

  // Level 1000: The Ultimate Challenge
  Challenge(
    description:
        "Complete ALL These in One Week: 500 push-ups, 10 km run, 5-minute plank, 1-hour meditation, 48-hour no phone, 10,000-word essay, Solve 50 math problems, Memorize 100 words, Speak to 20 strangers, lead a group discussion",
    rewardXP: 500,
    category: 'Ultimate',
    unlockLevel: 1000,
  ),
];
