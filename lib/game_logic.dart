import 'dart:math';
class Player{
  static const x ='X';
  static const o ='O';
  static const empty ='';
  static List<int>playerX = [];
  static List<int>playerO = [];
}
extension ContainsAll on List{
  bool containsALl (int x, int y, int z){
  return Player.playerX.contains(x) && Player.playerX.contains(y)&&Player.playerX.contains(z);
  }
}
class Game{
  void playGame(int index, String activePlayer) {
    if (activePlayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }
  checkWinner(){
    String winner ='';
    if (Player.playerX.containsALl(0, 1, 2)||
        Player.playerX.containsALl(3, 4, 5)||
        Player.playerX.containsALl(6, 7, 8)||
        Player.playerX.containsALl(0, 3, 6)||
        Player.playerX.containsALl(1, 4, 7)||
        Player.playerX.containsALl(2, 5, 8)||
        Player.playerX.containsALl(2, 4, 6)||
        Player.playerX.containsALl(0, 4, 8)
    )
    {
      winner = 'X';
    }
    else if
       (Player.playerO.containsALl(0, 1, 2)||
        Player.playerO.containsALl(3, 4, 5)||
        Player.playerO.containsALl(6, 7, 8)||
        Player.playerO.containsALl(0, 3, 6)||
        Player.playerO.containsALl(1, 4, 7)||
        Player.playerO.containsALl(2, 5, 8)||
        Player.playerO.containsALl(2, 4, 6)||
        Player.playerO.containsALl(0, 4, 8)
    ) {
      winner = 'O';
    } else {
      winner = '';
    }

    return winner;
  }
  Future<void> autoplay(activePlayer) async {
    int index =0;
    List<int> emptycells = [];
    for(var i = 0; i < 9 ; i++){
      if(!(Player.playerX.contains(i)||Player.playerO.contains(i))) {
        emptycells.add(i);
      }
    }
    Random random = Random();
   int randomIndex = random.nextInt(emptycells.length);
   index = emptycells[randomIndex];
   playGame(index, activePlayer);

  }
}