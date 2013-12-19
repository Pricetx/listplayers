class 'ListPlayers'

-- If a player types "/list"
OnPlayerChat = function(args)
    if args.text == "/list" then
        local stringlist = ""
        Chat:Send(args.player, "There are " .. Server:GetPlayerCount() .. " player(s) connected:", Color(0,153,255,0))
        for player in Server:GetPlayers() do

            -- If the string is already at or over 80 characters, start a new line
            if string.len(stringlist) >= 80 then
                Chat:Send(args.player, stringlist, Color(0,153,255,0))
                stringlist = player:GetName() .. ", "
            else
                stringlist = stringlist .. player:GetName() .. ", "
            end
        end
        -- string.sub removes the trailing comma
        Chat:Send(args.player, string.sub(stringlist,0,-1), Color(0,153,255,0))
    end
end

-- If somebody in the server console types "list"
List = function()
    print("There are " .. Server:GetPlayerCount() .. " players connected:")
    for player in Server:GetPlayers() do
        print(player:GetName())
    end
end

Events:Subscribe("PlayerChat", OnPlayerChat)
Console:Subscribe("list", List)
