-- require("obsidian").setup({
--
--     workspaces = {
--         {
--             name = "DigitalBrain",
--             path = "~/DB",
--         },
--     },
--  --    #TODO ui stuff is broken so I'm just disabling it at the moment
--     ui = {
--         enable = true,         -- set to false to disable all additional syntax features
--         update_debounce = 200, -- update delay after a text change (in milliseconds)
--         -- Define how various check-boxes are displayed
--         checkboxes = {
--             -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
--             [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
--             ["x"] = { char = "", hl_group = "ObsidianDone" },
--             [">"] = { char = "", hl_group = "ObsidianRightArrow" },
--             ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
--             -- Replace the above with this if you don't have a patched font:
--             -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
--             -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },
--
--             -- You can also add more custom ones...
--         },
--         external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
--         -- Replace the above with this if you don't have a patched font:
--         -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
--         -- reference_text = { hl_group = "ObsidianRefText" },
--         -- tags = { hl_group = "ObsidianTag" },
--         hl_groups = {
--             -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
--             ObsidianTodo = { bold = true, fg = "#f78c6c" },
--             ObsidianDone = { bold = true, fg = "#89ddff" },
--             ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
--             ObsidianTilde = { bold = true, fg = "#ff5370" },
--             ObsidianRefText = { underline = true, fg = "#c792ea" },
--             ObsidianExtLinkIcon = { fg = "#c792ea" },
--             ObsidianTag = { italic = true, fg = "#89ddff" },
--         },
--     },
--     disable_frontmatter = true,
--     note_frontmatter_func = function(note)
--         -- This is equivalent to the default frontmatter function.
--         local out = { id = note.id, tags = note.tags }
--         -- `note.metadata` contains any manually added fields in the frontmatter.
--         -- So here we just make sure those fields are kept in the frontmatter.
--         if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
--             for k, v in pairs(note.metadata) do
--                 out[k] = v
--             end
--         end
--         return out
--     end,
--
-- })
