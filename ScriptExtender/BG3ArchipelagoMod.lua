-- BG3ArchipelagoMod.lua

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
        Ext.Print(msg)          -- Script Extender console (F11)
        Ext.Utils.Print(msg)    -- Logs to bg3.log
    end
end)
