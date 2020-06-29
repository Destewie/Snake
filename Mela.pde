class Mela
{
  int x, y;

  Mela()
  {
    teleport();
  }
  
  void show()
  {
    push();
    fill(255, 0, 0);
    rect(x, y, grid, grid);
    pop();
  }

  void teleport()
  {
    x = (int)random(0, width/grid) * grid;
    y = (int)random(0, height/grid) * grid;
  }
}
