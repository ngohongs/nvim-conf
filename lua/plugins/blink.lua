return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
        'rafamadriz/friendly-snippets',
        'giuxtaposition/blink-cmp-copilot',
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = 'super-tab',
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer", "copilot" },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-cmp-copilot",
                    score_offset = 100,
                    async = true,
                    transform_items = function(ctx, items)
                        for _, item in ipairs(items) do
                            item.kind_icon = ''
                            item.kind_name = 'Copilot'
                        end
                        return items
                    end
                },
            },
        },

        appearance = {
            -- -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
            kind_icons = {
                Copilot = "",
                Text = '󰉿',
                Method = '󰊕',
                Function = '󰊕',
                Constructor = '󰒓',

                Field = '󰜢',
                Variable = '󰆦',
                Property = '󰖷',

                Class = '󱡠',
                Interface = '󱡠',
                Struct = '󱡠',
                Module = '󰅩',

                Unit = '󰪚',
                Value = '󰦨',
                Enum = '󰦨',
                EnumMember = '󰦨',

                Keyword = '󰻾',
                Constant = '󰏿',

                Snippet = '󱄽',
                Color = '󰏘',
                File = '󰈔',
                Reference = '󰬲',
                Folder = '󰉋',
                Event = '󱐋',
                Operator = '󰪚',
                TypeParameter = '󰬛',
            },
        },
        completion = {
            ghost_text = {
                enabled = true,
            },
            menu = {
                border = "rounded",
                winhighlight =
                "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
                auto_show_delay_ms = 500,
                draw = {
                    components = {
                        kind = {
                            text = function(ctx) return "[" .. ctx.kind .. "]" end,
                            highlight = function(ctx) return ctx.kind_hl end,
                        },
                    },
                    columns = { { "kind_icon" }, { "label" }, { "kind" } },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = {
                    border = "rounded",
                    scrollbar = false,
                }
            },

        },

        signature = {
            enabled = true,
            window = {
                scrollbar = false,
                border = "rounded",
                show_documentation = true,
            },
        },
    },
}
