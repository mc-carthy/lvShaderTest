function love.load()
    myShader = love.graphics.newShader[[
        vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
            //This is the current pixel color
            vec4 pixel = Texel(texture, texture_coords);
            //return pixel * color;
            return vec4(0.75, 0.0, 0.0, 1.0);
        }
    ]]
end


function love.update(dt)

end

function love.draw()
    love.graphics.setShader(myShader)
    love.graphics.rectangle("fill", 50, 50, 200, 200)
    love.graphics.setShader()
  end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end