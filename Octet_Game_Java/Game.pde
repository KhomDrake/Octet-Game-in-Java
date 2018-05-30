class Game
{
  Elements[] options;
  Elements[][] board; 
  boolean inGame;
  int score = 0;

  Game(Elements[] op)
  {
    this.options = op;
    board = new Elements[5][5];
  }


  void Show(int startX, int startY, int size)
  {
    if (!inGame)
    {
      scene = 0;
      return;
    }

    for (int i = 0; i < 5; i++)
    {
      for (int j = 0; j < 5; j++)
      {
        int x = startX + i * size;
        int y = startY + j * size;

        noFill();
        stroke(255);
        rect(x, y, size, size);

        if (board[i][j] != null)
        {
          pushMatrix();
          fill(0, 125, 125);
          textAlign(CENTER, CENTER);
          textSize(size/2);
          text(board[i][j].symbol, x + size/2, y + size/2);
          fill(0,255,0);
          textSize(size/10);
          text(board[i][j].eletronsLastLayer, x + size * 0.90, y + size/7);
          
          if(board[i][j].ionValue != 0)
          {
            fill(255, 0, 255);
            text(board[i][j].ionValue, x + size * 0.10, y + size/7);
          }
          popMatrix();
        }
      }
    }
    
    fill(255,0,0);
    textSize(height / 20);
    text("Score: " + score, width * 0.9, height * 0.05);
  }

  void AddRandomElement(int Quantity)
  {
    ArrayList<PVector> Position = new ArrayList();

    for (int i = 0; i < 5; i++)
    {
      for (int j = 0; j < 5; j++)
      {
        if (this.board[i][j] == null)
        {
          Position.add(new PVector(i, j));
        }
      }
    }

    if (Position.size() == 0)
    {
      this.inGame = false;
      return;
    }

    for (int i = 0; i < Quantity; i++)
    {
      int a = (int)random(0, Position.size());
      PVector ran = Position.get(a);
      Elements el = options[(int)random(0, this.options.length)];

      board[(int)ran.x][(int)ran.y] = el;

      Position.remove(a);
    }
  }

  void MoveBoard(int move)
  {
    if (move == 0 || move == 1)
    {
      Elements newBoard[][] = this.board;

      for (int i = 0; i < 5; i++)
      {
        boolean side = move == 1 ? true : false;
        Elements newRow[];
        Elements row[] = { newBoard[i][0], newBoard[i][1], newBoard[i][2], newBoard[i][3], newBoard[i][4] };
        newRow = Slide(row, side);
        newRow = Combine(newRow, side);
        newRow = Slide(newRow, side);

        newBoard[i][0] = newRow[0];
        newBoard[i][1] = newRow[1];
        newBoard[i][2] = newRow[2];
        newBoard[i][3] = newRow[3];
        newBoard[i][4] = newRow[4];
      }

      AddRandomElement(1);
    } else if (move == 2 || move == 3)
    {
      Elements newBoard[][] = this.board;

      for (int i = 0; i < 5; i++)
      {
        boolean side = move == 2 ? true : false;
        Elements newRow[];
        Elements row[] = { newBoard[0][i], newBoard[1][i], newBoard[2][i], newBoard[3][i], newBoard[4][i] };
        newRow = Slide(row, side);
        newRow = Combine(newRow, side);
        newRow = Slide(newRow, side);

        newBoard[0][i] = newRow[0];
        newBoard[1][i] = newRow[1];
        newBoard[2][i] = newRow[2];
        newBoard[3][i] = newRow[3];
        newBoard[4][i] = newRow[4];
      }

      AddRandomElement(1);
    }
  }

  Elements[] Slide(Elements[] row, boolean side)
  {
    Elements newRow[] = new Elements[5];
    int spot;

    if (side)
    {
      spot = 0;
      for (int i = 0; i < 5; i++) {
        if (row[i] != null && spot >= 0 && spot < 5)
        {
          newRow[spot] = row[i];
          spot++;
        }
      }
    } else
    {
      spot = 4;
      for (int i = 0; i < 5; i++) {
        if (row[i] != null && spot >= 0 && spot < 5)
        {
          newRow[spot] = row[i];
          spot--;
        }
      }
    }

    return newRow;
  }

  Elements[] Combine(Elements[] row, boolean side)
  {
    Elements rowCombine[] = new Elements[5];

    if (side)
    {
      for (int i = 0; i < row.length; i++) {
        if (i + 1 < row.length && row[i] != null
          && row[i + 1] != null && row[i].CombineTwo(row[i + 1]))
        {
          row[i] = null;
          row[i + 1] = null;
          score++;
        } else if (i + 1 < row.length && i + 2 < row.length && row[i] != null && row[i + 1] != null &&
          row[i + 2] != null && row[i].CombineThree(row[i + 1], row[i + 2]))
        {
          row[i] = null;
          row[i + 1] = null;
          row[i + 2] = null;
          score+= 2;
        } else
        {
          rowCombine[i] = row[i];
        }
      }
    } else
    {
      for (int i = 4; i > 0; i--) {
        if (i - 1 >= 0 && row[i] != null
          && row[i - 1] != null && row[i].CombineTwo(row[i - 1]))
        {
          row[i] = null;
          row[i - 1] = null;
          score++;
        } else if (i - 1 >= 0 && i - 2 >= 0 && row[i] != null && row[i - 1] != null && row[i - 2] != null && row[i].CombineThree(row[i - 1], row[i - 2]))
        {
          row[i] = null;
          row[i - 1] = null;
          row[i - 2] = null;
          score+= 2;
        } else
        {
          rowCombine[i] = row[i];
        }
      }
    }
    return rowCombine;
  }
}  
