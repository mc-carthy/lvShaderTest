local shaderCode = [[
    vec4 effect(vec4 colour, Image image, vec2 uvs, vec2 screen_coords) {
        vec4 pixel = Texel(image, uvs);

        float av = (pixel.r + pixel.g + pixel.b) / 3;
        
        //return vec4(1.0, 0.0, 0.0, 1.0);
        //return pixel * colour;
        return vec4(av, av, av, 1.0) * colour;
    }
]]

function love.load()
    image = love.graphics.newImage('assets/img/zelda.jpg')
    shader = love.graphics.newShader(shaderCode)
end

function love.draw()
    love.graphics.setShader(shader)
    -- love.graphics.setColor(1.0, 0.0, 0.0, 1.0)
    love.graphics.draw(image, 0, 0)
    love.graphics.setShader()
end

function love.keypressed(key)
    if key == "r" then love.event.quit "restart" end
    if key == "escape" then love.event.quit(0) end
end