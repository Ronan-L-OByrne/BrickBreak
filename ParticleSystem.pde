//Stores the particle effect Values
class ParticleSystem
{
    ArrayList<Particles> particles;
    PVector origin;
    int Lifespan;
    color col;
  
    // Constructor for ParticleSystem
    ParticleSystem(PVector position, int col)
    {
        this.origin = position.copy();
        this.particles = new ArrayList<Particles>();
        this.Lifespan = 100;
        this.col = color(col);
    }//end ParticleSystem
    
    String toString()
    {
            return origin + "\t" + Lifespan + "\t" + col;
    }//end toString()
  
    // Adds a particle to the system
    void addParticle()
    {
        particles.add(new Particles(origin,col));
    }//end addParticle()
  
    // Runs and displays the effect
    void run()
    {
        for (int i = particles.size()-1; i >= 0; i--)
        {
            Particles p = particles.get(i);
            p.runEffect();
            
            if (p.isDead())
            {
                particles.remove(i);
            }//end if
        }//end for
    }//end run()
}//end ParticleSystem

//Stores the values needed for the individual particles
class Particles
{
    PVector position;
    PVector velocity;
    PVector acceleration;
    int lifespan;
    color particleColor;
    float theta;
    PShape shard;
    
    //Constructor for Particles
    Particles(PVector orig, int col)
    {
        this.position = new PVector(random(orig.x-width*(.17)*(.5), orig.x+width*(.17)*(.5)), orig.y);
        this.velocity = new PVector(random(-1, 1), random(-2,0));
        this.acceleration = new PVector(0, 0.05);
        this.lifespan = 255;
        this.particleColor = color(col);//color(random(150,255), random(75,100), random(75,100));
        this.theta = random(0, TWO_PI);
    }//end ParticleEffect
    
    String toString()
    {
            return position.x + "\t" + position.y + "\t" + velocity.x + "\t" + velocity.y + "\t" + acceleration.x + "\t" + acceleration.y + "\t" + lifespan + "\t" +particleColor + "\t" + theta;
    }//end toString()
  
    // Updates and displays the particle
    void runEffect()
    {
        updateParticle();
        displayParticle();
    }//end runEffect()
    
    //Updates the position of the particle
    void updateParticle()
    {
        shardShape();
        velocity.add(acceleration);
        position.add(velocity);
        if(velocity.x < 0)
        {
            theta -= .3;
        }//end if
        else
        {
            theta += .3;
        }//end else
        
        lifespan -= 2.55;
    }//end updateParticle()
    
    // The shape of the particle
    void shardShape()
    {
        shard = createShape();
          shard.beginShape();
          shard.stroke(particleColor, lifespan);
          shard.fill(particleColor, lifespan);
          shard.vertex(-(width+height)*(.005), (width+height)*(.005));
          shard.vertex(0, -(width+height)*(.005));
          shard.vertex((width+height)*(.005), (width+height)*(.005));
        shard.endShape(CLOSE);
    }//end shardShape()
    
    //Displays the particles to output
    void displayParticle()
    {
        pushMatrix();
          translate(position.x, position.y);
          rotate(theta);
          shape(shard);
        popMatrix();
    }//end displayParticle()
    
    //Checks if the particle sould be deleted
    boolean isDead()
    {
        if (lifespan < 0.0)
        {
            return true;
        }//end if
        else
        {
            return false;
        }//end else
    }//end isDead()
}//end class Particle