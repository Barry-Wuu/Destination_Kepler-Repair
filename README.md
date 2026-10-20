# Destination Kepler（修复版仓库）

<b>简体中文</b> ｜ <a href="README.en.md">English</a>

Flash 游戏《Destination Kepler》的可玩修复版 + 官方独立播放器。

## 黑屏问题与修复说明

原版 SWF 在本地（Flash Player Projector）运行时，点击 Begin Game 后会黑屏：
游戏启动时会加载 Kongregate API（API_AS3_*.swf），本地离线运行时发生
`SecurityError #2121`（安全沙箱违规，LoaderInfo.content 跨域访问被拒），
该异常未被捕获，导致游戏初始化中断 → 黑屏。网页版正常是因为在 Kongregate 域内加载合法。

本仓库 `game/destination-kepler.swf` 为**打补丁后的修复版**：
修改 `com.KongregateApiLoader.loadComplete()`，捕获沙箱异常并以游客模式继续游戏。

## 使用方法

1. 下载整个仓库（Code → 下载 ZIP，或 git clone）
3. 双击 `游戏启动_Ruffle.bat` 开始游玩

## 启动方式


`游戏启动_Ruffle.bat` 使用开源 Ruffle 播放器，完全不依赖 Adobe Flash，永远不会有版本弹窗。
游戏专用补丁版：`game/destination-kepler-ruffle.swf`（跳过预加载兼容补丁 + 去除 Kongregate 联网依赖）。


## 文件说明

- `game/destination-kepler.swf` — 游戏主文件（修复版，20 MB，Flash 30 / Stage3D）
- `player/flashplayer_32_0_0_270_sa.exe` — Adobe Flash Player Projector **32.0.0.270**（2020-03 版，无 EOL 时间锁）
- `游戏启动.bat` — Windows 一键启动脚本

> 注意：需要 Flash Player 32（支持 Stage3D）。Flash Player 11 或 Ruffle 会出现开始后黑屏/不兼容。
