# Starlight

A 2D platformer built in **Godot 4.4** with GDScript — coins, enemies, and a
slime that will not go away.

![Godot](https://img.shields.io/badge/engine-Godot%204.4-blue) ![GDScript](https://img.shields.io/badge/script-GDScript-355d9b)

---

## Gameplay

- **Run, jump and roll.** The roll is wired through a `rolling` signal that the
  platforms listen for, so it is more than a cosmetic animation.
- **Slimes** patrol back and forth, using two `RayCast2D` probes to detect the
  edge of a platform and turn around instead of walking off it. Touching one
  kills you.
- **Coins** are collected on contact and play a pickup animation, with the count
  tracked in the HUD.
- **Killzones** and **platforms** round out the level.

## Running it

Open the project in Godot 4.4 or newer:

```bash
godot --path . 
```

Or open `project.godot` from the Godot project manager and press **F5**.

A Windows export preset is included, so **Export → Windows Desktop** produces a
playable build. Pre-built `.exe` files from earlier runs are committed at the
repository root if you just want to try it without opening the editor.

> The committed `.exe` files at the repository root are older Windows builds,
> kept for reference. You do not need them.

## Project layout

```
scenes/
  game.tscn          main scene
  player.tscn        player character
  coin.tscn          collectible
  slime.tscn         patrolling enemy
  platform.tscn      platform
  killzone.tscn      hazard
  music.tscn         audio
scripts/             GDScript, one file per scene
assets/
  sprites/           tileset, player, slime, coin, fruit, platforms
  sounds/  music/  fonts/
export_presets.cfg   Windows Desktop export
```

## Notes

Built to get comfortable with Godot's scene tree, signals and physics — the
slime's edge detection and the roll/platform signal wiring were the interesting
parts.
