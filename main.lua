function love.load()
    joe = {}
    joe.image = love.graphics.newImage("assets/img/joe.png")
    joe.x = love.graphics.getWidth() / 2
    joe.y = love.graphics.getHeight() / 2
    joe.w = joe.image:getWidth()
    joe.h = joe.image:getHeight()
    joe.speed = 500
    myShader = love.graphics.newShader[[
        // Color represents the colour set by love.graphics.setColor()
        // Texture represents the image being drawn
        // texture_coords represent the normalised coordinates of the of the current pixel relative to the image
        // screen_coords represent the normalised coordinates of the of the current pixel relative to the screen
        extern number screen_width;
        vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords){
            if (screen_coords.x > screen_width / 2) {
                return vec4(0.75, 0.0, 0.0, 1.0);
            } else {
                return vec4(0.0, 0.0, 0.75, 1.0);
            }
        }
        ]]
    myShader:send("screen_width", love.graphics.getWidth())
end


function love.update(dt)
    if love.keyboard.isDown("right") then
        joe.x = joe.x + joe.speed * dt
    end
    if love.keyboard.isDown("left") then
        joe.x = joe.x - joe.speed * dt
    end
    if love.keyboard.isDown("up") then
        joe.y = joe.y - joe.speed * dt
    end
    if love.keyboard.isDown("down") then
        joe.y = joe.y + joe.speed * dt
    end
end

function love.draw()
    love.graphics.setShader(myShader)
    -- love.graphics.rectangle("fill", 50, 50, 200, 200)
    love.graphics.draw(joe.image, joe.x, joe.y, 0, 1, 1, joe.w / 2, joe.h / 2)
    love.graphics.setShader()
  end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end