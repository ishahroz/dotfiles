# Hammerspoon Config

## Config Location

We first need to run the following command to update the config location:

```bash
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon-config/init.lua"
```

## Key Bindings

### Hyper Key Bindings

I am using `F19` as my `Hyper` key, for the following bindings:

| Binding                            | Mnemonic            | Action                                    | Read more                                                                     | Border Color                                 |
| ---------------------------------- | ------------------- | ----------------------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------- |
| `Hyper + b`                        | (B)ookmarks         | Search bookmarks in `Raindrop`            | `Raycast` -> `General` -> `Extensions` -> `Raindrop` -> `Search Bookmarks`    |
| `Hyper + c`                        | (C)odex             | Launch/Focus `Codex`                      | Global Binding.                                                               |
| `Hyper + d`                        | (D)iscord           | Launch/Focus `Discord`                    | Global Binding
| `Hyper + e`                        | (E)macs             | Launch/Focus Emacs                        | Global Binding
| `Hyper + f`                        | (F)inder            | Finder (Apple)                            | Global Binding                                                                |                                              |
| `Hyper + g`                        | (G)oogle Chrome     | Launch/Focus `Google Chrome`              | Global Binding.                                                               |                                              |
| `Hyper + h`                        | (H)ammerspoon       | Activate `Hammerspoon` config modal       | [config.lua](#configlua)                                                      | <span style="color:#ffff00"> #FFFF00 </span> |
| `Hyper + i`                        | (I)ntelliJ          | Launch/Focus `IntelliJ IDEA`              | Global Binding.                                                               |
| `Hyper + m`                        | (M)ail              | Launch/Focus `Apple Mail`                 | Global Binding.                                                               |                                              |
| `Hyper + n`                        | (N)otion            | Launch/Focus `Notion`                     | Global Binding.                                                               |                                              |
| `Hyper + o`                        | (O)bsidian          | Launch/Focus `Obsidian`                   | Global Binding.                                                               |                                              |
| `Hyper + p`                        | (P)ycharm           | Launch/Focus `PyCharm`                    | Global Binding.                                                               |
| `Hyper + s`                        | (S)lack             | Launch/Focus `Slack`                      | Global Binding.                                                               |                                              |
| `Hyper + t`                        | (T)erminal          | Launch/Focus `Ghostty`                    | Global Binding. Search for `_hyperBindings` in [init.lua](./init.lua).        |                                              |
| `Hyper + v`                        | (V)S Code           | Launch/Focus `VS Code`                    | Global Binding.                                                               |                                              |
| `Hyper + w`                        | (W)hatsApp          | Launch/Focus `WhatsApp`                   | Global Binding.                                                               |                                              |
| `Hyper + y`                        | (Y)abai / AeroSpace | Activate `AeroSpace` modal                | [aerospace.lua](#aerospacelua)                                                | <span style="color:#F74F9E"> #F74F9E </span> |
| `Hyper + space`                    |                     | Launch/Focus `Raycast`                    | Binding passed through (local bindings) to `Raycast` (`Raycast` -> `General`) |                                              |
| `Hyper + [` (Open Square Bracket)  |                     | Launch/Focus `Apple Notes`                | Global Binding.                                                               |                                              |
| `Hyper + ]` (Close Square Bracket) |                     | Launch/Focus `Apple Calendar`             | Global Binding.                                                               |                                              |
| `Hyper + \` (Backslash)            |                     | Launch/Focus `Things 3`                   | Global Binding                                                                |                                              |
| `Hyper + ,` (Comma)                |                     | Search in `Notion`                        | `Raycast` -> `General` -> `Extensions` -> `Notion` -> `Search Notion`         |                                              |
| `Hyper + .` (Dot)                  |                     | Search in `Obsidian`                      | `Raycast` -> `General` -> `Extensions` -> `Obsidian` -> `Search Notes`        |                                              |
| `Hyper + /` (Slash)                |                     | Launch/Focus secondary browser `(Floorp)` | Global Binding.                                                               |                                              |
| `Home`                             |                     | Open/Close `Raycast`                      | Global Binding.                                                               |                                              |
| `End`                              |                     | Open/Close `Things 3` Task Entry Dialog   | Global Binding.                                                               |                                              |

#### Exit the activated modal

Press `Ctrl + c` or `Esc` to exit the activated modal. I have mapped `Caps Lock` **tap** to `Esc` in [Karabiner Elements](https://karabiner-elements.pqrs.org/) (`Esc` key would work too).

### Command Key Bindings

| Binding       | Mnemonic | Action                         | Read more              |
| ------------- | -------- | ------------------------------ | ---------------------- |
| `Command + q` | (Q)uit   | Hold for 6 seconds to quit app | [slowq.lua](#slowqlua) |

## Spoons

### [Hyper.spoon](./Spoons/Hyper.spoon/README.md)

Hyper lets you to bind to `Hyper` key set by [Karabiner Elements](https://karabiner-elements.pqrs.org/) (in my case `F19`) and:

- Use `Hyper` in combination with other keys to trigger actions / activate modals.
- There is also concept of local bindings, which lets you to pass `Shift + Ctrl + Option + Cmd` instead of what you set as `Hyper` key. This is useful because a lot of applciations consider `Shift + Ctrl + Option + Cmd` as the default hyper key.
- Make sure to add local bindings to the `_hyperBindings` table in [init.lua](./init.lua#L40) for the application you want to pass through .

## Active Lua Scripts:

I am currently using the following scripts:

### [config.lua](./config.lua)

Bindings for the Hammerspoon configuration. `Hyper + h` to activate the config modal and then:

| Binding     | Action                   |
| ----------- | ------------------------ |
| `r`         | Reload the config        |
| `shift + r` | Open Hammerspoon console |

### [slowq.lua](./slowq.lua)

SlowQ lets you hold `Command + q` for a while (default `6 seconds`) before closing an app, so you won't do it accidentally. Replaces apps like [CommandQ](https://commandqapp.com/) and [SlowQuitApps](https://github.com/dteoh/SlowQuitApps).

### [chrome.lua](./chrome.lua)

Bindings for Google Chrome:

- Focus tab by domain in any window
- Kill tabs by domain

### [aerospace.lua](./aerospace.lua)

Bindings for [AeroSpace](https://github.com/nikitabobko/AeroSpace). `Hyper + y` to activate the AeroSpace modal.

- Make sure `AeroSpace` is [installed and running](https://nikitabobko.github.io/AeroSpace/guide#homebrew-installation) using Homebrew.
- If installed without Homebrew, make sure to update the `aerospacePath` in the [script](aerospace.lua#L1) with the correct path to the aerospace binary:

  ```bash
  which aerospace
  ```

| Binding                    | Action                                   |
| -------------------------- | ---------------------------------------- |
| `/` (Slash)                | Layout: Tiles (horizontal, vertical)     |
| `,` (Comma)                | Layout: Accordion (horizontal, vertical) |
| `r`                        | Reload AeroSpace config                  |
| `h`                        | Focus window in West (left)              |
| `j`                        | Focus window in South (down)             |
| `k`                        | Focus window in North (up)               |
| `l`                        | Focus window in East (right)             |
| `shift + h`                | Move window in West (left)               |
| `shift + j`                | Move window in South (down)              |
| `shift + k`                | Move window in North (up)                |
| `shift + l`                | Move window in East (right)              |
| `[` (Open Square Bracket)  | Resize window (decrease)                 |
| `]` (Close Square Bracket) | Resize window (increase)                 |
| `1`                        | Workspace: 1                             |
| `2`                        | Workspace: 2                             |
| `3`                        | Workspace: 3                             |
| `4`                        | Workspace: 4                             |
| `9`                        | Workspace: 9-Calendar                    |
| `0`                        | Workspace: 0-Other                       |
| `b`                        | Workspace: Browser                       |
| `c`                        | Workspace: Communication                 |
| `e`                        | Workspace: Editor                        |
| `n`                        | Workspace: Notes                         |
| `t`                        | Workspace: Terminal                      |
| `shift + 1`                | Move: Node to Workspace: 1               |
| `shift + 2`                | Move: Node to Workspace: 2               |
| `shift + 3`                | Move: Node to Workspace: 3               |
| `shift + 4`                | Move: Node to Workspace: 4               |
| `shift + 9`                | Move: Node to Workspace: 9-Planner       |
| `shift + 0`                | Move: Node to Workspace: 0-Other         |
| `shift + b`                | Move: Node to Workspace: Browser         |
| `shift + c`                | Move: Node to Workspace: Communication   |
| `shift + e`                | Move: Node to Workspace: Editor          |
| `shift + m`                | Move: Node to Workspace: Mail            |
| `shift + n`                | Move: Node to Workspace: Notes           |
| `shift + t`                | Move: Node to Workspace: Terminal        |

## Unused Lua Scripts:

I am not using the following scripts but they are still here for the future reference.

### [yabai.lua](./yabai.lua)

Bindings for [yabai](https://github.com/koekeishiya/yabai). `Hyper + y` to activate the yabai modal.

- Make sure `yabai` is [installed and running](<https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)>) using Homebrew.
- If installed without Homebrew, make sure to update the `yabaiPath` in the [script](yabai.lua#L1) with the correct path to the yabai binary:

  ```bash
  which yabai
  ```

| Binding            | Action                                  |
| ------------------ | --------------------------------------- |
| `h`                | Focus window in West (left)             |
| `j`                | Focus window in South (down)            |
| `k`                | Focus window in North (up)              |
| `l`                | Focus window in East (right)            |
| `shift + h`        | Swap window in West (left)              |
| `shift + j`        | Swap window in South (down)             |
| `shift + k`        | Swap window in North (up)               |
| `shift + l`        | Swap window in East (right)             |
| `u`, `i`, `o`, `p` | Set window ratio to 0.3, 0.5, 0.7, 0.8  |
| `space`            | Toggle between `bsp` and `stack` layout |

## References:

- Original source for [Hyper.spoon](https://github.com/evantravers/Hyper.spoon)
- Original source for [slowq.lua](https://github.com/dbmrq/Dotfiles/blob/master/Hammerspoon/.hammerspoon/slowq.lua)
- Original source for [yabai.lua](https://github.com/evantravers/dotfiles/blob/master/.config/hammerspoon/init.lua#L55-L178)
- [chrome.lua](./chrome.lua) is based on [brave.lua](https://github.com/evantravers/dotfiles/blob/master/.config/hammerspoon/brave.lua)
