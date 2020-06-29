class Pezzo
{
  int x, y;
  boolean testa;
  //int r = (int)random(0, 255), g = (int)random(0, 255), b = (int)random(0, 255);
  
  Pezzo(boolean t, int Coordx, int Coordy)
  {
    testa = t;
    x = Coordx;
    y = Coordy;
  }
  

  void updateTesta()
  {
    x = constrain((x + (grid * dirX)), 0, width-grid);
    y = constrain((y + (grid * dirY)), 0, height-grid);
  }
  

  void show()
  {
    //fill(r, g, b);
    rect(x, y, grid, grid);
  }
  
  
}
