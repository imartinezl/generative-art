PVector index2grid(int index, int nx, int ny) {
  return new PVector(floor(index/ny), index % nx);
}

int grid2index(PVector pos, int nx, int ny) {
  return int(pos.x*ny + pos.y);
}
IntList getNeighbors(int index, int nx, int ny) {
  PVector pos = index2grid(index, nx, ny);
  IntList neighbors = new IntList();
  for (int i=-1; i<=1; i++) {
    for (int j=-1; j<=1; j++) {
      if ((i == 0 && j!=0) || (j == 0 && i!=0)) {
        float newX = pos.x + i;
        float newY = pos.y + j;
        if (newX >= 0 && newX < nx && newY >= 0 && newY < ny) {
          PVector neighbor = new PVector(pos.x + i, pos.y + j);
          int neighborIndex = grid2index(neighbor, nx, ny);
          neighbors.append(neighborIndex);
        }
      }
    }
  }
  return neighbors;
}


boolean rejectType(int type, IntList neighborsType) {
  boolean reject = false;
  switch(type) {
  case 0: 
    reject = neighborsType.hasValue(3) || neighborsType.hasValue(0);
    break;
  case 1: 
    reject = neighborsType.hasValue(2) || neighborsType.hasValue(1);
    break;
  case 2:
    reject = neighborsType.hasValue(1) || neighborsType.hasValue(2);
    break;
  case 3:
    reject = neighborsType.hasValue(0) || neighborsType.hasValue(3);
    break;
  }
  return reject;
}
