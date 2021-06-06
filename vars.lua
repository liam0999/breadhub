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
};

for i,v in next, vars do
    genv[i] = v
end