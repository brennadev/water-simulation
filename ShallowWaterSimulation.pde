// Copyright 2019 Brenna Olson. You may download this code for informational purposes only.

final int cellCount = 20;
final float dx = 20;
final float maxHeight = 100;

WaterCell[] cells = new WaterCell[cellCount]; 


void setup() {
    size(600, 400, P2D);
    
    // TODO: I'm not sure what the momentum value should be
    for(int i = 0; i < cellCount; i++) {
        cells[i] = new WaterCell(i + 2, 1);
    }
}

void draw() {
    background(0);
    
    // updates
    for(int i = 0; i < cellCount; i++) {
        
    }
    
    // rendering
    fill(255);
    for(int i = 0; i < cellCount; i++) {
        rect(i * dx, maxHeight - cells[i].height, dx, cells[i].height);
    }
}
