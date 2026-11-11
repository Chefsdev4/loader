-- Public bootstrap for the key system. Contains NO secrets and NO product code.
-- Set _G.Key (and _G.Product) before loading this, then:
--   loadstring(game:HttpGet("https://raw.githubusercontent.com/Chefsdev4/loader/main/loader.lua"))()
-- It sends the key to the license server, which returns the real script only if the key is valid.
-- REQUIRES in the game: Allow HTTP Requests = ON  and  LoadStringEnabled = ON
local SERVER = "https://cym39nf88pp4.ample.run"

local key = tostring(_G.Key or _G.LicenseKey or "")
local product = tostring(_G.Product or "")
if key == "" then warn("[License] set _G.Key before loading") return end
if product == "" then warn("[License] set _G.Product before loading") return end

local url = SERVER .. "/api/loader?product=" .. product .. "&key=" .. key
          .. "&hwid=roblox-" .. tostring(game.GameId)

local ok, body = pcall(function() return game:HttpGet(url) end)
if not ok then warn("[License] server unreachable: " .. tostring(body)) return end

local fn, err = loadstring(body)
if not fn then warn("[License] load error: " .. tostring(err)) return end
fn()
