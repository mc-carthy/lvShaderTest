function love.load()
    joe = love.graphics.newImage("assets/img/joe.png")
    myShader = love.graphics.newShader[[
        // Color represents the colour set by love.graphics.setColor()
        // Texture represents the image being drawn
        // texture_coords represent the normalised coordinates of the of the current pixel relative to the image
        // screen_coords represent the normalised coordinates of the of the current pixel relative to the screen
        vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords){
            //This is the current pixel color
            vec4 pixel = Texel(texture, texture_coords);
            return pixel * color;
            //return vec4(0.75, 0.0, 0.0, 1.0);
        }
    ]]
end


function love.update(dt)

end

function love.draw()
    love.graphics.setShader(myShader)
    -- love.graphics.rectangle("fill", 50, 50, 200, 200)
    love.graphics.draw(joe, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 1, 1, joe:getWidth() / 2, joe:getHeight() / 2)
    love.graphics.setShader()
  end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end