local genv = getgenv()

local scriptName do local _,e = pcall(function() error('') end) scriptName = e:split(":")[1] end

local vars = {
    RunService = game:GetService("RunService");
    ReplicatedStorage = game:GetService("ReplicatedStorage");
    TweenService = game:GetService("TweenService");
    TextService = game:GetService("TextService");
    UserInputService = game:GetService("UserInputService");
    MarketplaceService = game:GetService("RunService");
    TeamService = game:GetService("Teams");
    HttpService = game:GetService("HttpService");
    Players = game:GetService("Players");
    LocalPlayer = game:GetService("Players").LocalPlayer;
    Camera = workspace.CurrentCamera;
    ogScreenSize = workspace.CurrentCamera.ViewportSize;
    scriptName = scriptName;
    genv = getgenv();
    startTick = tick();
};

for i,v in next, vars do
    genv[i] = v
end