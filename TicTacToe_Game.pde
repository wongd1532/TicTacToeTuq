void setup() {
  size(500, 500);
  background(255, 255, 255);
  textSize(32);
  reset();
  fill(0);
  text("TicTacToe Game", 140, 30);
  text("Press 'r' to reset", 145, 460);
}

// array to hold gameState
int[] gameState = new int[9];
int turn = 1;
boolean game = true;


// resets board, turn, and game
void reset() {
  for(int i = 0; i < 9; i++) {
    gameState[i] = 0;
  }
  turn = 1;
  game = true;
  fill(255);
  noStroke();
  rect(0, 50, 500, 350);
  stroke(0);
}


//changes turn
void changeTurn() {
  if(turn == 1) {
    turn = 2;
  } else {
    turn = 1;
  }
}


//draw pieces
void drawXO(int x, int y, int gs) {
  if(gs == 1) {
    //draws x
    line(x-30, y-30, x+30, y+30);
    line(x-30, y+30, x+30, y-30);
  } else if (gs == 2) {
    //draws o
    noFill();
    circle(x, y, 80);
  }
}


// draws board
void drawBoard() {
  //draw hash
  line(200, 100, 200, 400);
  line(300, 100, 300, 400);
  line(100, 200, 400, 200);
  line(100, 300, 400, 300);
  
  //draw pieces according to gamestate
  for(int i = 0; i < 9; i++) {
    int tempY = 150 + 100*floor(i/3);
    int tempX = 150 + 100*(i%3);
    drawXO(tempX, tempY, gameState[i]);
  }
}


//changes gamestate when players make moves
void placePiece() {
  for(int i = 0; i < 9; i++) {
    int tempY = 150 + 100*floor(i/3);
    int tempX = 150 + 100*(i%3);
    if(mousePressed && mouseX > tempX - 50 && mouseX < tempX + 50 &&
    mouseY > tempY - 50 && mouseY < tempY + 50 && gameState[i] == 0) {
      gameState[i] = turn;
      changeTurn();
    }
  }
}


//win message
void winMessage() {
  String winner = "";
  if(turn == 2) {
    winner = "Player X";
  } else {
    winner = "Player O";
  }
  fill(0);
  text(winner + " is the Winner! :D", 85, 75);
}


//checks winner
void winCheck() {
  for (int i = 0; i < 3; i++) {
    if((gameState[3*i] != 0 && gameState[3*i] == gameState[3*i + 1] && gameState[3*i] == gameState[3*i + 2]) ||
    (gameState[i] != 0 && gameState[i] == gameState[i + 3] && gameState[i] == gameState[i+6]) ||
    (gameState[0] != 0 && gameState[0] == gameState[4] && gameState[0] == gameState[8]) ||
    (gameState[2] != 0 && gameState[2] == gameState[4] && gameState[2] == gameState[6])) {
      winMessage();
      game = false;
    }
  }
}


//resets board
void resetter() {
  if (keyPressed && (key == 'r' || key == 'R')) {
    reset();
  }
}


void draw() {
  if(game == true) {
    placePiece();
    drawBoard();
    winCheck();
  }
  resetter();
}

/*

Thank you for taking your time to check out my program / code. I'm a little rusty with all of my
programming languages, but I started learning js.Processing from a very young age on KhanAcademy and
still feel the most comfortable with it, I love the UI/UX focus especially. Ideally, I would've added
more buttons, features, and made the whole package more visually appealing, and there's definitely ways
to optimize the code in general, but I'd rather submit something rather than nothing. I wish I had
enough time to code a "over-board" and a "vs. computer" mode, but with other co-op applications and
mid-term examinations this week, I've been tight on time. My solution for the computer's sets of moves
would use the fact that all even indices in the gameState array are corner (or 4 = middle) positions,
and use relative board positions to determine the moves (e.g. 3 is adjacent to 0 and 4). The non-losing
strategy is well known so I won't describe it. Thank you for your time.

Sincerely,
David

*/
