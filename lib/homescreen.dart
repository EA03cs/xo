import 'package:flutter/material.dart';
import 'package:xo/game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0;
  String result = '';
  Game game = Game();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: const Text(
                'turn on/off two player mode',
                style: TextStyle(color: Colors.white, fontSize: 28),
                textAlign: TextAlign.center,
              ),
              value: isSwitched,
              onChanged: (bool newValue) {
                setState(() {
                  isSwitched = newValue;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'it\'s $activePlayer turn'.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 40),
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(16),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                    crossAxisCount: 3,
                  children: List.generate(9, (index) => InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: gameOver? null : ()=> _onTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).shadowColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: Text(
                        Player.playerX.contains(index)?
                        'X':Player.playerO.contains(index)?'O':'',style:TextStyle(color: Player.playerX.contains(index)? Colors.white: Colors.red, fontSize: 40),)),
                    ),
                  )),
                )),
            Text(
              result,
              style: const TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  Player.playerX=[];
                  Player.playerO=[];
                  activePlayer = 'X';
                  gameOver = false;
                  turn = 0;
                  result = '';
                });
              },
              icon: const Icon(Icons.replay),
              label: Text('Restart the game'.toUpperCase()),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTap(int index) async {
    if((Player.playerX.isEmpty||!Player.playerX.contains(index))&&(Player.playerO.isEmpty||!Player.playerO.contains(index))){
      game.playGame(index,activePlayer);
      update();
      if (!isSwitched&& !gameOver && turn!=9){
     await game.autoplay(activePlayer);
     update();
      }
    }
  }

  void update() {
    setState(() {
      activePlayer = (activePlayer =='X')?'O':'X';
      turn++;

      String winnerPlayer =game.checkWinner();
      if(winnerPlayer != ''){
        gameOver = true;
        result ="$winnerPlayer is the winner".toUpperCase();
      }
      else if(!gameOver && turn ==9){
        result ="it's draw".toUpperCase();
      }
    });
  }
}
