-- Script to list number and names of players to console or chat
-- Original Author, Jonathan Price
-- License can be found at https://github.com/Pricetx/listplayers
-- Version: 0.1
class 'ListPlayers'

-- This code executes when the class is created
function ListPlayers:__init()
	-- Text color used in chat messages
	self.chatColor = Color(0,153,255)

	-- Subscribe to the player chat event, in the class's function "OnPlayerChat"
	Events:Subscribe("PlayerChat", self, self.OnPlayerChat)
	
	-- Subscribe to the console command "list"
	Console:Subscribe("list", self, self.List)
end

-- Player typed "/list"
function ListPlayers:OnPlayerChat(args)
    if args.text == "/list" then
        local stringlist = ""
        Chat:Send(args.player, "There are " .. Server:GetPlayerCount() .. " player(s) connected:", self.chatColor)

        for player in Server:GetPlayers() do
            -- If the string is already at or over 80 characters, start a new line
            if string.len(stringlist) >= 80 then
                Chat:Send(args.player, stringlist, self.chatColor)
                stringlist = player:GetName() .. ", "
            else
                stringlist = stringlist .. player:GetName() .. ", "
            end
        end
        -- string.sub removes the trailing comma
        Chat:Send(args.player, string.sub(stringlist,0,-3), self.chatColor)
    end
end

-- Executes when the command "list" is used
function ListPlayers:List()
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

-- Initialize the class "ListPlayers". If we don't do this, the __init() function will never be called
local listPlayers = ListPlayers()
