import 'dart:io';

/// This function asks the player for their name.
String a_Pname(String player) {
  stdout.write("Enter $player: ");
  String? plput = stdin.readLineSync();

  if (plput == null || plput.trim().isEmpty) {
    return player;
  }

  return plput.trim();
}

/// This function checks if the move is valid.
String? v_strat(String plput) {
  List<String> moves = ["rock", "paper", "scissors"];

  plput = plput.trim().toLowerCase();

  if (moves.contains(plput)) {
    return plput;
  }
  return null;
}

/// This function is where we get the player's move.
String getPlayerMove(String player) {
  String? move;
  while (move == null) {
    stdout.write("$player: ");
    String? plput = stdin.readLineSync();

    /// This is where we validate the player moves.
    move = v_strat(plput ?? "");
    if (move == null) {
      print("Invalid move.");
    }
  }

  return move;
}

/// This is where we decide the winner.
String? pick_Pwin(String pmove1, String pmove2) {
  if (pmove1 == pmove2) {
    return null;
  }
  if (pmove1 == "rock" && pmove2 == "scissors") {
    return "Player 1";
  } else if (pmove1 == "paper" && pmove2 == "rock") {
    return "Player 1";
  } else if (pmove1 == "scissors" && pmove2 == "paper") {
    return "Player 1";
  }
  return "Player 2";
}

void main() {
  print("ROCK, PAPER, AND SCISSORS GAME");

  String player1 = a_Pname("Player 1");
  String player2 = a_Pname("Player 2");

  int p1score = 0;
  int p2score = 0;
  String again;

  /// This part does the main game loop, where we ask for the players' moves, decide the winner, and keep track of the score.
  do {
    print("\nNew Round");

    // This is where we get the players moves.
    String pmove1 = getPlayerMove(player1);

    // Hide the Player 1's move so that Player 2 cannot see it
    for (int i = 0; i < 30; i++) {
      print("");
    }

    String pmove2 = getPlayerMove(player2);

    print("$player1 chose $pmove1");
    print("$player2 chose $pmove2");

    String? winner = pick_Pwin(pmove1, pmove2);

    if (winner == "Player 1") {
      p1score++;
    } else if (winner == "Player 2") {
      p2score++;
    }

    print("Winner: ${winner ?? "Draw"}");
    print("Score: $p1score - $p2score");

    stdout.write("Play again? (y/n): ");
    String? plput = stdin.readLineSync();

    again = plput?.trim().toLowerCase() ?? "n";
  } while (again == "y");

  // The final total score and the winner is displayed.
  print("\nFinal Score");
  print("$player1: $p1score");
  print("$player2: $p2score");

  if (p1score > p2score) {
    print("$player1 is the winner!");
  } else if (p2score > p1score) {
    print("$player2 is the winner!");
  } else {
    print("Both players are draw!");
  }
}
