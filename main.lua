-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

nbrePV = 5
local imgCoeurG = nil
local imgCoeurD = nil
timer = 0

function pv(pX, pY)
    local largeurImgG = imgCoeurG:getWidth()
    local largeurImgD = imgCoeurD:getWidth()
    -- cg cd cg cd
    for n = 1, nbrePV do
        local coeurG = (n % 2) ~= 0

        if coeurG then
            love.graphics.draw(imgCoeurG, pX, pY)
        else
            love.graphics.draw(imgCoeurD, pX, pY)
        end
        if coeurG == false then
            pX = pX + largeurImgG
        end
    end
end

function love.load()
    imgCoeurG = love.graphics.newImage("img/coeur_gauche.png")
    imgCoeurD = love.graphics.newImage("img/coeur_droit.png")
end

function love.update(dt)
    timer = timer + dt * 3
    if timer > 2 then
        timer = 0
    end
end

function love.draw()
    local affichePV = true
    if nbrePV == 1 then
        if math.floor(timer) == 0 then
            affichePV = false
        end
    end
    if affichePV then
        pv(10, 10)
    end
end

function love.keypressed(key)
    nbrePV = nbrePV - 1
end
