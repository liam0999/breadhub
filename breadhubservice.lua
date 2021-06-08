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
            if getgenv().console == true then
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
        breadhub.console.err(table.concat({"From: "..path,"Line: "..line,"Message: "..msg}," || "))
        breadhub.console.error()
    end
    return s,e
end