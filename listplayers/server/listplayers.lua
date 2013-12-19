class 'ListPlayers'

-- If a player types "/list"
OnPlayerChat = function(args)
    if args.text == "/list" then
        local stringlist = ""
        Chat:Send(args.player, "There are " .. Server:GetPlayerCount() .. " player(s) connected:", Color(0,153,255))

        for player in Server:GetPlayers() do
            -- If the string is already at or over 80 characters, start a new line
            if string.len(stringlist) >= 80 then
                Chat:Send(args.player, stringlist, Color(0,153,255))
                stringlist = player:GetName() .. ", "
            else
                stringlist = stringlist .. player:GetName() .. ", "
            end
        end
        -- string.sub removes the trailing comma
        Chat:Send(args.player, string.sub(stringlist,0,-3), Color(0,153,255))
    end
end

-- If somebody in the server console types "list"
List = function()
    local stringlist = ""
    print("There are " .. Server:GetPlayerCount() .. " player(s) connected:")

    for player in Server:GetPlayers() do
        -- If the string is already at or over 80 characters, start a new line
        if string.len(stringlist) >= 80 then
            print(stringlist)
            stringlist = player:GetName() .. ", "
        else
            stringlist = stringlist .. player:GetName() .. ", "
        end
    end
    -- string.sub removes the trailing comma
    print(string.sub(stringlist,0,-3))
end

Events:Subscribe("PlayerChat", OnPlayerChat)
Console:Subscribe("list", List)
