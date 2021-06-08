local genv = getgenv()
local breadhub = {}

--------------------------------------------------------------------------------------------------------------------------- << getTimeString

function breadhub.getTimeString(brackets)
    local time = os.date("*t")
    local str = table.concat({string.format("%0.2i",time.hour),string.format("%0.2i",time.min),string.format("%0.2i",time.sec)},":")
    return brackets == true and "["..str.."]" or str
end

--------------------------------------------------------------------------------------------------------------------------- << Console

breadhub.console = {
    log = {color = "@@LIGHT_CYAN@@", title = "BREADHUB"};
    error = {color = "@@RED@@", title = "ERROR"};
    warn = {color = "@@BROWN@@", title = "WARN"};
    info = {color = "@@CYAN@@", title = "INFO"};
    hook = {color = "@@YELLOW@@", title = "HOOK"};
    hint = {color = "@@LIGHT_MAGENTA@@", title = "HINT"};
}

for _,v in next, breadhub.console do
    setmetatable(v,{
        __call = function(t,...)
            if genv.console == true then
                local args = {...}
                local data = {}

                data[1] = breadhub.getTimeString(true)
                data[2] = v.title
                data[3] = args[1]

                rconsoleprint(v.color or "@@WHITE@@")
                rconsoleprint("\n"..table.concat(data," | "))
            end
        end
    })
end

--------------------------------------------------------------------------------------------------------------------------- << logpcall

function breadhub.logpcall(func,...)
    local s,e = pcall(func,...)
    if not s then
        local split = e:split(":")
        local path,line,msg = split[1],split[2],split[3]
        if path == scriptName then path = "BreadHub" end
        breadhub.console.error(table.concat({"From: "..path,"Line: "..line,"Message: "..msg}," || "))
    end
    return s,e
end

--------------------------------------------------------------------------------------------------------------------------- << team checks

local lplr = game:GetService("Players").LocalPlayer

function breadhub.isFriendly(plr,teamcolor)
    if teamcolor then
        if lplr.TeamColor == plr.TeamColor then
            return true
        else
            return false
        end
    else
        if lplr.Team == plr.Team then
            return true
        else
            return false
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------- << call

setmetatable(breadhub,{__index = function(t,i)
    
end})

local gamemt = getrawmetatable(game)
local old = gamemt.__namecall

setreadonly(gamemt,false)

gamemt.__namecall = newcclosure(function(Self,...)
    local a = {...}
    local method = getnamecallmethod()

    if not checkcaller() and Self == game and method == "GetSerivce" and a[1] == "breadhub" then
        return breadhub
    end

    return old(Self,...)
end)

setreadonly(gamemt,true)


return breadhub