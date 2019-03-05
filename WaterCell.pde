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
    
    void update(float dt) {
        midpointHeight = (height + nextCell.height) / 2 - (dt / 2.0) * (momentum + nextCell.momentum) / dx;
        midpointMomentum = (momentum + nextCell.momentum) / 2 - (dt/ 2.0) * (sqrt(nextCell.momentum) / nextCell.height + 0.5 * gravity * sqrt(nextCell.height) - 
            sqrt(midpointHeight) / height - 0.5 * gravity * sqrt(height)) / dx;
        
        nextCell.height -= dt * (nextCell.midpointMomentum - midpointMomentum) / dx;
        nextCell.momentum -= dt * (sqrt(nextCell.midpointMomentum) / nextCell.midpointHeight + .5 * gravity * sqrt(nextCell.midpointHeight) - 
            sqrt(midpointMomentum) / midpointHeight - 0.5 * gravity * sqrt(midpointHeight)) / dx;
    }
}
