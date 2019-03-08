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
    
    // should momentum and height values be going negative? Clamping to 0 doesn't make sense here
    // the momentum and height values eventually go negative, no matter whether I go through forward or backward. I'm not handling anything with the edges because
    // of the way I have the WaterCell class set up - not sure if that's the correct thing to do though
    
    for(int j = 0; j < 100; j++) {
        for(int i = 0; i < cellCount; i++) {
            cells[i].updateHalfStep(0.002);
        }
        
        // doesn't matter whether it's cellCount or cellCount - 1
        for(int i = 0; i < cellCount; i++) {
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
    

    

    
    // rendering
    fill(0, 220, 255);
    for(int i = 0; i < cellCount; i++) {
        rect(i * dx, maxHeight - (cells[i].height * 3), dx, cells[i].height * 3);
    }
}
