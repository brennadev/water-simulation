// Copyright 2019 Brenna Olson. You may download this code for informational purposes only.

final int cellCount = 100;
final float dx = 5;
final float maxHeight = 100;
final float gravity = 3;

WaterCell[] cells = new WaterCell[cellCount]; 


void setup() {
    size(600, 400, P2D);
    
    for(int i = cellCount - 1; i >= 0; i--) {
        cells[i] = new WaterCell(3, 0);
        
        // the cell that appears to the right of the current cell
        if (i != cellCount - 1) {
            cells[i].nextCell = cells[i + 1];
            
        // when at the rightmost cell, the next cell just reuses its own data - so it holds a reference to itself    
        } else {
            cells[i].nextCell = cells[i];
        }
    }
    
    // make one cell much higher so a wave happens
    cells[10].height = 8;
}

void draw() {
    background(0);
    
    // updates
    for(int j = 0; j < 100; j++) {
        for(int i = 0; i < cellCount; i++) {
            cells[i].updateHalfStep(0.002);
        }
        
        for(int i = 0; i < cellCount; i++) {
            cells[i].updateFullStep(0.002);
        }
    }
    
    // rendering
    fill(0, 220, 255);
    for(int i = 0; i < cellCount; i++) {
        rect(i * dx, maxHeight - (cells[i].height * 3), dx, cells[i].height * 3);
    }
}
