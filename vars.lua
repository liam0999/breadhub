local genv = getgenv()

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
    startTick = tick();
};

for i,v in next, vars do
    genv[i] = v
end

genv.varsloaded = true