class WaterCell {
    float height;
    float momentum;
    float midpointHeight;
    float midpointMomentum;
    
    WaterCell nextCell;
    
    public WaterCell(float height, float momentum) {
        this.height = height;
        this.momentum = momentum;
        
        // just so they're initialized to something - will get set properly on the first update call in the draw loop
        midpointHeight = 0;
        midpointMomentum = 0;
    }
    
    void updateHalfStep(float dt) {
        midpointHeight = (height + nextCell.height) / 2 - (dt / 2.0) * (momentum + nextCell.momentum) / dx;
        
        if (midpointHeight > maxHeight) {
            midpointHeight = maxHeight;
        } else if (midpointHeight < 0) {
            midpointHeight = 0;
        }
        
        if (height > 0) {
            midpointMomentum = (momentum + nextCell.momentum) / 2 - (dt/ 2.0) * (pow(nextCell.momentum, 2) / nextCell.height + 0.5 * gravity * pow(nextCell.height, 2) - 
                pow(midpointHeight, 2) / height - 0.5 * gravity * pow(height, 2)) / dx;
        }
    }
    
    void updateFullStep(float dt) {
        nextCell.height -= dt * (nextCell.midpointMomentum - midpointMomentum) / dx;
        
        if (nextCell.height > maxHeight) {
            nextCell.height = maxHeight;
        } else if (nextCell.height < 0) {
            nextCell.height = 0;
        }
        
        if (midpointHeight > 0) {
            nextCell.momentum -= dt * (pow(nextCell.midpointMomentum, 2) / nextCell.midpointHeight + .5 * gravity * pow(nextCell.midpointHeight, 2) - 
                pow(midpointMomentum, 2) / midpointHeight - 0.5 * gravity * pow(midpointHeight, 2)) / dx;
        }
    }
    

}
