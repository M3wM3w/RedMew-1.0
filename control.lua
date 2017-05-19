-- Enhanced Vanilla
-- A 3Ra Gaming compilation
-- config and event must be required first.
require "util"
require "locale/utils/event"
require "config"
require "locale/utils/utils"
require "announcements"
require "rocket"
require "poll"
require "tag"

-- Give player starting items.
-- @param event on_player_joined event
function player_joined(event)
	local player = game.players[event.player_index]
		player.insert { name = "iron-axe", count = 1 }
		player.insert { name = "raw-fish", count = 1 }
	--player.insert { name = "iron-plate", count = 20 }
	--player.insert { name = "pistol", count = 1 }
	--player.insert { name = "firearm-magazine", count = 10 }
	--player.insert { name = "grenade", count = 5 }
end

function giev()
	local player = game.players[1]
	player.insert { name = "rocket-silo", count = 1 }
	player.insert { name = "low-density-structure", count = 120 }
	player.insert { name = "rocket-fuel", count = 120 }
	player.insert { name = "rocket-control-unit", count = 120 }
	player.insert { name = "steel-chest", count = 1 }
	player.insert { name = "substation", count = 1 }
	player.insert { name = "solar-panel", count = 10 }
	player.insert { name = "fast-inserter", count = 1 }
	player.insert { name = "satellite", count = 1 }
	end		
-- Give player weapons after they respawn.
-- @param event on_player_respawned event

--function player_respawned(event)
	--local player = game.players[event.player_index]
	--player.insert { name = "pistol", count = 1 }
	--player.insert { name = "firearm-magazine", count = 10 }
--end

Event.register(defines.events.on_research_finished, function (event)
	local research = event.research
	if global.scenario.config.logistic_research_enabled then
		research.force.technologies["logistic-system"].enabled=true
	else
	    research.force.technologies["logistic-system"].enabled=false
	end
end)


-- Event handlers
--Event.register(defines.events.on_gui_click, on_gui_click)
Event.register(defines.events.on_player_created, player_joined)
Event.register(defines.events.on_player_respawned, player_respawned)
