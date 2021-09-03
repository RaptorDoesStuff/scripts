-- Gets the UpdateId (Unix Timestamp of the date the game was last updated) of the game you are currently in, useful for checking if game has updated and a script needs to be updated
return(tostring(DateTime.fromIsoDate(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Updated).UnixTimestamp))
