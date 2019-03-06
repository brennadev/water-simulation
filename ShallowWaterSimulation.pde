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
        cells[i] = new WaterCell((i + 2) * 0.25, 20);
        
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
    
    for(int j = 0; j < 10; j++) {
    for(int i = cellCount - 1; i >= 0; i--) {
        cells[i].updateHalfStep(0.002);
    }
    
    for(int i = cellCount - 1; i >= 0; i--) {
        cells[i].updateFullStep(0.002);
    }
    }
    
    
    println("cell 2:");
    println("height: " + cells[2].height);
    println("momentum: " + cells[2].momentum);
    println("midpointheight: " + cells[2].midpointHeight);
    println("midpointmomentum: " + cells[2].midpointMomentum);
    println("nextcell height: " + cells[2].nextCell.height);
    println("nextcell momentum " + cells[2].nextCell.momentum);
    println();
    
    println("cell 10:");
    println("height: " + cells[10].height);
    println("momentum: " + cells[10].momentum);
    println("midpointheight: " + cells[10].midpointHeight);
    println("midpointmomentum: " + cells[10].midpointMomentum);
    println("nextcell height: " + cells[10].nextCell.height);
    println("nextcell momentum " + cells[10].nextCell.momentum);
    println();
    
    // rendering
    fill(0, 220, 255);
    for(int i = 0; i < cellCount; i++) {
        rect(i * dx, maxHeight - (cells[i].height * 3), dx, cells[i].height * 3);
    }
}
