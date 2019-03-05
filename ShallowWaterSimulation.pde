// Copyright 2019 Brenna Olson. You may download this code for informational purposes only.

final int cellCount = 20;
final float dx = 20;
final float maxHeight = 100;
final float gravity = 9.8;

WaterCell[] cells = new WaterCell[cellCount]; 


void setup() {
    size(600, 400, P2D);
    
    // TODO: I'm not sure what the momentum value should be
    for(int i = cellCount - 1; i >= 0; i--) {
        cells[i] = new WaterCell(i + 2, 20);
        
        // the cell that appears to the right of the current cell
        if (i != cellCount - 1) {
            cells[i].nextCell = cells[i + 1];
            
        // when at the rightmost cell, the next cell just reuses its own data - so it holds a reference to itself    
        } else {
            cells[i].nextCell = cells[i];
        }
    }
}

void draw() {
    background(0);
    
    // updates
    
    for(int j = 0; j < 100; j++) {
    for(int i = 0; i < cellCount; i++) {
        cells[i].update(0.002);
    }
    }
    
    println("height: " + cells[10].height);
    println("momentum: " + cells[10].momentum);
    
    // rendering
    fill(255);
    for(int i = 0; i < cellCount; i++) {
        rect(i * dx, maxHeight - cells[i].height, dx, cells[i].height);
    }
}
