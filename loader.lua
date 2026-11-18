-- Public bootstrap for the key system. Contains NO secrets and NO product code.
-- Set your key before loading this (getgenv().Key is checked first, then _G.Key), then:
--   loadstring(game:HttpGet("https://raw.githubusercontent.com/Chefsdev4/loader/main/loader.lua"))()
-- The key alone identifies the product; the server returns the real script only if the key is valid.
-- REQUIRES in the game: Allow HTTP Requests = ON  and  LoadStringEnabled = ON
local SERVER = "https://cym39nf88pp4.ample.run"

local genv = (type(getgenv) == "function") and getgenv() or nil
local key = tostring((genv and (genv.Key or genv.LicenseKey)) or _G.Key or _G.LicenseKey or "")
if key == "" then warn("[License] set getgenv().Key (or _G.Key) before loading") return end

local url = SERVER .. "/api/loader?key=" .. key .. "&hwid=roblox-" .. tostring(game.GameId)

local ok, body = pcall(function() return game:HttpGet(url) end)
if not ok then warn("[License] server unreachable: " .. tostring(body)) return end

local fn, err = loadstring(body)
if not fn then warn("[License] load error: " .. tostring(err)) return end
fn()
