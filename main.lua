local shaderCode = [[
    extern vec2 screen;
    vec4 effect(vec4 colour, Image image, vec2 uvs, vec2 screen_coords) {
        vec4 pixel = Texel(image, uvs);

        vec2 sc = screen_coords.xy / screen;

        return vec4(sc, 1.0, 1.0) * pixel;
    }
]]

function love.load()
    image = love.graphics.newImage('assets/img/zelda.jpg')
    shader = love.graphics.newShader(shaderCode)
end

function love.draw()
    love.graphics.setShader(shader)
    -- love.graphics.setColor(1.0, 0.0, 0.0, 1.0)
    shader:send("screen", { love.graphics.getDimensions() })
    love.graphics.draw(image, 0, 0)
    -- love.graphics.rectangle('fill', 0, 0, love.graphics.getDimensions())
    love.graphics.setShader()
end

function love.keypressed(key)
    if key == "r" then love.event.quit "restart" end
    if key == "escape" then love.event.quit(0) end
end