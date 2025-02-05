import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MainPage()));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.blueAccent,
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: Center(
              child: MaterialButton(
            color: Colors.white,
            shape: const CircleBorder(),
            height: 150,
            minWidth: 150,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const GamePage()));
            },
            child: const Text("START"),
          )),
        ),
        Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: const CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const GamePage()));
                },
                child: const Text("START"),
              ),
            )),
      ],
    ));
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double blueCardHeight = 0;
  double redCardHeight = 0;

  int playerAScore = 0;
  int playerBScore = 0;

  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      blueCardHeight = MediaQuery.of(context).size.height / 2;
      redCardHeight = MediaQuery.of(context).size.height / 2;

      initialized = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              print(blueCardHeight);

              setState(() {
                blueCardHeight = blueCardHeight + 30;
                redCardHeight = redCardHeight - 30;

                playerBScore = playerBScore + 5;
              });

              double winningHeight = MediaQuery.of(context).size.height - 60;

              print(blueCardHeight);
              print(winningHeight);

              if (blueCardHeight > winningHeight) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(playerBScore, "b")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: blueCardHeight,
              color: Colors.blueAccent,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Player A",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    playerBScore.toString(),
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                redCardHeight = redCardHeight + 30;
                blueCardHeight = blueCardHeight - 30;

                playerAScore = playerAScore + 5;
              });

              double screenHeight = MediaQuery.of(context).size.height;
              double winningHeight = MediaQuery.of(context).size.height - 60;

              print(redCardHeight);
              print(winningHeight);

              if (redCardHeight > winningHeight) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(playerAScore, "a")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: redCardHeight,
              color: Colors.redAccent,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Player B",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    playerAScore.toString(),
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  int score = 0;
  String player = "";

  ResultPage(this.score, this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "a" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Text(
              player == "a" ? "PLAYER B WON" : "PLAYER A WON",
              style: const TextStyle(fontSize: 35),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: const Text("Restart Game"),
            )
          ],
        ),
      ),
    );
  }
}