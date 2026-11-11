-- Public bootstrap for the key system. Contains NO secrets and NO product code.
-- Set _G.Key before loading this, then:
--   loadstring(game:HttpGet("https://raw.githubusercontent.com/Chefsdev4/loader/main/loader.lua"))()
-- The key alone identifies the product; the server returns the real script only if the key is valid.
-- REQUIRES in the game: Allow HTTP Requests = ON  and  LoadStringEnabled = ON
local SERVER = "https://cym39nf88pp4.ample.run"

local key = tostring(_G.Key or _G.LicenseKey or "")
if key == "" then warn("[License] set _G.Key before loading") return end

local url = SERVER .. "/api/loader?key=" .. key .. "&hwid=roblox-" .. tostring(game.GameId)

local ok, body = pcall(function() return game:HttpGet(url) end)
if not ok then warn("[License] server unreachable: " .. tostring(body)) return end

local fn, err = loadstring(body)
if not fn then warn("[License] load error: " .. tostring(err)) return end
fn()
