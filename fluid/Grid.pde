int IX(int i, int j) {
  return i + j * (N + 2);
}


class Grid {

  Cell[] cells;

  Grid() {
    cells = new Cell[size];
  }

  void initilize() {
    for (int x = 0; x < N+2; x++) {
      float px = map(x, 0, N + 1, -1, 1);

      for (int y = 0; y < N+2; y++) {
        float py = map(y, 0, N + 1, -1, 1);
        cells[IX(x, y)] = new Cell(new PVector(px, py));
      }
    }
  }

  void add_source(PVector[] s) {
    for (int i = 0; i < size; i++) {
      cells[i].u.add(PVector.mult(s[i], dt));
    }
  }
  
  //dont forget about set_bnd that needs a int b
  void diffuse(){
    float a = dt * diff * N * N;
    
    for(int k = 0; k < 20; k++){
      for(int i = 1; i <= N; i++){
        for(int j = 1; j <= N; j++){
          //get all neigboring densities 
          PVector left = cells[IX(i - 1, j)].u;
          PVector right = cells[IX(i + 1, j)].u;
          PVector up = cells[IX(i, j + 1)].u;
          PVector down = cells[IX(i, j - 1)].u;
          PVector sum = PVector.add(left, right, up);
          sum.add(down);
          sum.mult(a);
          //add previous density 
          sum.add(cells[IX(i, j)].u0);
          sum.mult(1 + 4 * a);
          cells[IX(i, j)].u = sum;
        }
      }
    }
  
  }

  void show() {
    for (int i = 0; i < size; i++) {
      Cell p = cells[i];
      point(p.posR.x, p.posR.y);
    }
  }

  void showVel() {
    for (Cell c : cells) {
      c.updateVel();
      c.showVel();
    }
  }
}