import 'package:flutter/material.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  int selected = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Set Weekly Goal"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [3, 5, 7].map((e) {
              return GestureDetector(
                onTap: () => setState(() => selected = e),
                child: Card(
                  color: selected == e ? Colors.purple : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("$e Days"),
                  ),
                ),
              );
            }).toList(),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Save Goal")),
        ],
      ),
    );
  }
}
