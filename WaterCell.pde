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
        
    }
}
