// Copyright 2019 Brenna Olson. You may download this code for informational purposes only.

final int cellCount = 20;
final float dx = 0.1;

WaterCell[] cells = new WaterCell[cellCount]; 

void setup() {
    size(400, 400, P2D);
    
    // TODO: I'm not sure what the momentum value should be
    for(int i = 0; i < cellCount; i++) {
        cells[i] = new WaterCell(i + 2, 1);
    }
}

void draw() {
    background(0);
    fill(255);
    for(int i = 0; i < cellCount; i++) {
        rect(i * dx * 20, cells[i].height, dx * 20, cells[i].height);
    }
}
