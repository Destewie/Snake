int grid = 20;  //<>//

ArrayList<Pezzo> Serpente = new ArrayList<Pezzo>();
int dirX = 1;
int dirY = 0;

Mela m;

boolean bisognaAggiungere = false; //se è true, quando shifto tutte le coordinate devo aggiungere un nuovo pezzo al serpente
boolean morto = false;

void setup()
{
  size(800, 800);
  frameRate(10);

  Serpente.add(new Pezzo(true, 20, 20));  //il pezzo in testa
  //print(Serpente.size());
  m = new Mela();
}

void draw()
{

  if (!morto)
  {
    background(230);

    for (Pezzo p : Serpente)
    {
      if (p.testa)
        p.updateTesta();

      p.show();
    }

    m.show();

    Mangiato();

    ControlloMorte();
    ShiftCoordinates();
  } else
  {
    background(240, 0, 0);
  }
}

void keyPressed()
{
  if (morto)
  {
    morto = false;
  } else
  {

    if (key == CODED)
    {
      if (keyCode == LEFT)
      {
        if (Serpente.size() != 1 && dirX == 1)
        {
        } else
        {
          ChangeDir(-1, 0);
        }
      } else if (keyCode == RIGHT)
      {
        if (Serpente.size() != 1 && dirX == -1)
        {
        } else
        {
          ChangeDir(1, 0);
        }
      } else if (keyCode == UP)
      {
        if (Serpente.size() != 1 && dirY == 1)
        {
        } else
        {
          ChangeDir(0, -1);
        }
      } else if (keyCode == DOWN)
      {
        if (Serpente.size() != 1 && dirY == -1)
        {
        } else
        {
          ChangeDir(0, 1);
        }
      }
    }
  }
}

void ChangeDir(int x, int y)
{
  dirX = x;
  dirY = y;
}

void ShiftCoordinates() //Trasla la posizione dei pezzi del serpente tranne della testa, quella andrà aggiornata a parte
{
  if (bisognaAggiungere)
  {
    AggiungiCoda((Serpente.get(Serpente.size()-1).x), (Serpente.get(Serpente.size()-1).y));

    for (int i = Serpente.size()-2; i > 0; i--) 
    {
      Pezzo p = Serpente.get(i);
      p.x = Serpente.get(i-1).x;
      p.y = Serpente.get(i-1).y;
    }

    bisognaAggiungere = false;
  } else
  {
    for (int i = Serpente.size()-1; i > 0; i--) 
    {
      Pezzo p = Serpente.get(i);
      p.x = Serpente.get(i-1).x;
      p.y = Serpente.get(i-1).y;
    }
  }
}

void AggiungiCoda(int xFinale, int yFinale)
{
  Serpente.add(new Pezzo(false, xFinale, yFinale));
}


void ControlloMorte()
{
  for (int i = Serpente.size()-1; i > 0; i--) 
  {
    if (Serpente.get(0).x == Serpente.get(i).x  && Serpente.get(0).y == Serpente.get(i).y) //se si scontra con qualche altro pezzo
    {
      print("Morto\n");
      morto = true;      
      break;
    }
  }

  if (morto)
  {
    for (int j = Serpente.size()-1; j>0; j--)
    {
      Serpente.remove(j);
    }

    ChangeDir(1, 0);
    Serpente.get(0).x = 20;
    Serpente.get(0).y = 20;
    m.teleport();
  }
}

void Mangiato()
{
  if (Serpente.get(0).x == m.x && Serpente.get(0).y == m.y)
  {
    print("GNAM! ("+ Serpente.size() +")\n");
    bisognaAggiungere = true;
    m.teleport();
  }
}
