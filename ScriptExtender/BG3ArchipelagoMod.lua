-- BG3ArchipelagoMod.lua
-- Logs item pickups and writes them into a JSON file

-- Utility: Write JSON file
local function write_json(filename, data)
    local json = Ext.Json.Stringify(data, { Beautify = true }) -- pretty print JSON
    Ext.IO.SaveFile(filename, json)
end

-- Hook: When an item is added
Ext.Events.ItemAdded:Subscribe(function(e)
    local item = e.Item
    local owner = e.Owner

    if owner and owner.IsPlayer then
        local msg = string.format(
            "[BG3ArchipelagoMod] Player %s received item: %s (Template: %s)",
            owner.DisplayName,
            item.DisplayName,
            item.TemplateId
        )

        -- Log to console + bg3.log
        Ext.Print(msg)
        Ext.Utils.Print(msg)

        -- Data to export
        local event_data = {
            player = owner.DisplayName,
            item_name = item.DisplayName,
            item_template = item.TemplateId,
            timestamp = Ext.Utils.MonotonicTime()
        }

        -- Save JSON (overwrites each time for simplicity)
        write_json("BG3Archipelago_ItemPickup.json", event_data)
    end
end)
