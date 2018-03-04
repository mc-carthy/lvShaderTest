function love.load()
    time = 0
    joe = {}
    joe.image = love.graphics.newImage("assets/img/joe.png")
    joe.x = love.graphics.getWidth() / 2
    joe.y = love.graphics.getHeight() / 2
    joe.w = joe.image:getWidth()
    joe.h = joe.image:getHeight()
    joe.speed = 500
    myShader = love.graphics.newShader("src/fadeToGrey.glsl")

    myShader:send("screen_width", love.graphics.getWidth())
end


function love.update(dt)
    time = time + dt
    local factor = math.abs(math.cos(time))
    -- myShader:send("factor",factor)

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