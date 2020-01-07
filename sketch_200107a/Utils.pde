PVector index2grid(int index, int nx, int ny) {
  return new PVector(floor(index/ny), index % nx);
}

int grid2index(PVector pos, int nx, int ny) {
  return int(pos.x*ny + pos.y);
}
IntList neighbors(int index, int nx, int ny) {
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
