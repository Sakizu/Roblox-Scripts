local quick = loadstring(game:HttpGet('https://raw.githubusercontent.com/Sakizu/Roblox-Scripts/main/Quick/main.lua'))()

repeat wait() until (game and game:IsLoaded());

local s = quick.Service;

local workspace = s.Workspace;

local replicatedStorage = s.ReplicatedStorage;

local currentCamera = workspace.CurrentCamera;

local players = s.Players;

local virtualUser = s.VirtualUser;

local tweenService = s.TweenService;

local runService = s.RunService;

local stepped = runService.Stepped;
