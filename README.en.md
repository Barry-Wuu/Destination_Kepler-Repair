# Destination Kepler — Repaired Build

<a href="README.md">简体中文</a> ｜ <b>English</b>

A playable, repaired build of the Flash game *Destination Kepler*, together with the official standalone Flash player.

## Black-screen issue and how it was fixed

When the original SWF is run locally (Flash Player Projector), the game goes black after clicking **Begin Game**:
at startup the game loads the Kongregate API (`API_AS3_*.swf`), and when running offline it triggers
`SecurityError #2121` (a security-sandbox violation: cross-domain access to `LoaderInfo.content` is denied).
The exception is uncaught, so game initialisation aborts and the screen stays black. It works in a browser
because the game runs inside the Kongregate domain where the load is legal.

`game/destination-kepler.swf` in this repository is the **patched, repaired build**:
`com.KongregateApiLoader.loadComplete()` was modified to catch the sandbox exception and continue the game
as a guest.

## How to play

1. Download the whole repository (Code → Download ZIP, or `git clone`)
3. Double-click `游戏启动_Ruffle.bat` to start playing

## Launch options

`游戏启动_Ruffle.bat` uses the open-source Ruffle player, so it does not depend on Adobe Flash at all and
will never hit the EOL warning dialog. The dedicated patched build `game/destination-kepler-ruffle.swf`
skips the preloader compatibility patch and removes the Kongregate network dependency.

## File manifest

- `game/destination-kepler.swf` — main game file (repaired build, 20 MB, Flash 30 / Stage3D)
- `player/flashplayer_32_0_0_270_sa.exe` — Adobe Flash Player Projector **32.0.0.270** (2020-03 build, no EOL time-lock)
- `游戏启动.bat` — one-click Windows launcher

> Note: Flash Player 32 (with Stage3D support) is required. Flash Player 11 or Ruffle will show a black screen / be incompatible at start.
