Game game;

Elements elements[] = {
  new Elements(1, "H", 0), 
  new Elements(3, "Li", 0), 
  new Elements(4, "Be", 0), 
  new Elements(5, "B", 0), 
  new Elements(6, "C", 0), 
  new Elements(7, "N", 0), 
  new Elements(8, "O", 0), 
  new Elements(9, "F", 0), 
  new Elements(11, "Na", 0), 
  new Elements(12, "Mg", 0), 
  new Elements(13, "Al", 0), 
  new Elements(14, "Si", 0), 
  new Elements(15, "P", 0), 
  new Elements(16, "S", 0), 
  new Elements(17, "Cl", 0)
};

Elements elementsWithIons[] = {
  new Elements(1,"H",0),
  new Elements(3,"Li",0),
  new Elements(4,"Be",0),
  new Elements(5,"B",0),
  new Elements(6,"C",0),
  new Elements(7,"N",0),
  new Elements(8,"O",0),
  new Elements(9,"F",0),
  new Elements(4,"Be",-1),
  new Elements(5,"B",-1),
  new Elements(5,"B",-2),
  new Elements(6,"C",-1),
  new Elements(6,"C",-2),
  new Elements(6,"C",-3),
  new Elements(7,"N",-1),
  new Elements(7,"N",-2),
  new Elements(7,"N",-3),
  new Elements(8,"O",-1),
  new Elements(8,"O",-2),
  new Elements(8,"O",-3),
  new Elements(9,"F",-1),
  new Elements(9,"F",-2),
  new Elements(9,"F",-3),
  new Elements(3,"Li",1),
  new Elements(3,"Li",2),
  new Elements(3,"Li",3),
  new Elements(4,"Be",1),
  new Elements(4,"Be",2),
  new Elements(4,"Be",3),
  new Elements(5,"B",1),
  new Elements(5,"B",2),
  new Elements(5,"B",3),
  new Elements(6,"C",1),
  new Elements(6,"C",2),
  new Elements(6,"C",3),
  new Elements(7,"N",1),
  new Elements(7,"N",2),
  new Elements(8,"O",1),
  new Elements(11,"Na",0),
  new Elements(12,"Mg",0),
  new Elements(13,"Al",0),
  new Elements(14,"Si",0),
  new Elements(15,"P",0),
  new Elements(16,"S",0),
  new Elements(17,"Cl",0),
  new Elements(11,"Na",1),
  new Elements(11,"Na",2),
  new Elements(11,"Na",3),
  new Elements(12,"Mg",1),
  new Elements(12,"Mg",2),
  new Elements(12,"Mg",3),
  new Elements(13,"Al",1),
  new Elements(13,"Al",2),
  new Elements(13,"Al",3),
  new Elements(14,"Si",1),
  new Elements(14,"Si",2),
  new Elements(14,"Si",3),
  new Elements(15,"P",1),
  new Elements(15,"P",2),
  new Elements(16,"S",1),
  new Elements(12,"Mg",-1),
  new Elements(13,"Al",-1),
  new Elements(13,"Al",-2),
  new Elements(14,"Si",-1),
  new Elements(14,"Si",-2),
  new Elements(14,"Si",-3),
  new Elements(15,"P",-1),
  new Elements(15,"P",-2),
  new Elements(15,"P",-3),
  new Elements(16,"S",-1),
  new Elements(16,"S",-2),
  new Elements(16,"S",-3),
  new Elements(17,"Cl",-1),
  new Elements(17,"Cl",-2),
  new Elements(17,"Cl",-3)
};

ArrayList<Button> buttons = new ArrayList<Button>(); 

int scene = 0;
int size = (width/2)/5;
int startX = width/4;
int startY = width/40;
boolean inGame;

void setup()
{
  fullScreen();
  size = (width/2)/5;
  startX = width/4;
  startY = width/40;
  buttons.add(new Button(width/4, height * 0.25, width * 0.50, height * 0.20, "Normal Mode"));
  buttons.add(new Button(width/4, height * 0.65, width * 0.50, height * 0.20, "With Ions Mode"));
  buttons.add(new Button(0, height * 0.95, width * 0.05, height * 0.05, "back"));
}

void draw()
{
  background(51);

  if (scene == 0)
  {
    for (int i = 0; i < 2; i++)
    {
      buttons.get(i).Show();
    }
  } else
  {
    game.Show(startX, startY, size);
    buttons.get(2).Show();
  }
}

void mousePressed()
{

  if (scene == 0)
  {
    if (buttons.get(0).isPressed())
    {
      game = new Game(elements);
      game.AddRandomElement(1);
      game.inGame = true;
      scene = 1;
    }

    if (buttons.get(1).isPressed())
    {
      game = new Game(elementsWithIons);
      game.AddRandomElement(1);
      game.inGame = true;
      scene = 2;
    }
  } 
  else
  {
    if (buttons.get(2).isPressed())
    {
      scene = 0;
    }
  }
}

void keyPressed()
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      game.MoveBoard(1);
    } else if (keyCode == DOWN) 
    {
      game.MoveBoard(0);
    } else if (keyCode == LEFT) 
    {
      game.MoveBoard(2);
    } else if (keyCode == RIGHT) 
    {
      game.MoveBoard(3);
    }
  }
}
