# Zero Records

Add-on for Mescht's Zero Practice (1.2.1 and 1.2.2) and the Zero mode in
Dibedy's MCSR Practice 2.0.0. Minecraft Java 1.16.1 only, it won't load on
anything newer.

Roughly what it adds:

- a Zero Cycle Archive that keeps every kill: times, approach, angle, the lot
- a flydown predictor: right after the kill it simulates the rest of the flight
  and prints the predicted finish time, so you don't have to wait for it
- extra settings pages on top of the base ones: Dragon (Fly Chance, Fireball
  Chance, On Crystal Break, Vanilla End Entry), Info (Timing Tracker, Fire
  Resistance and friends) and a Custom Spawns pool
- a Natural Terrain option next to Spawn: real End terrain around every spawn
  instead of Mescht's stand-in cages (off by default)
- spawns up to Buried 66 (seed -78224660128093), and Natural Distribution rolls
  each spawn about as often as real seeds do: Open 54.3%, Overhang 17.3%, o56
  9.3%, down to o66 at about 1 in 570 billion

## Installing

Drop the zip (or the folder) into the world's `datapacks` folder and make sure
it sits above the base Zero pack, and above LobbySystem if you're on MCSR. Then
`/reload`. Don't remove the base packs, this only overrides parts of them.

On MCSR `/trigger zero` and `/trigger hub` work like before. The pack keeps its
spot above ZeroPractice when you come back, does nothing while you're in another
mode, and drops any pending dragon spawn or teleport when you switch. Records
and settings stick around between visits.

Zero 1.2.1 keeps its own loadouts, there's nothing to migrate. It also gets the
path tracer 1.2.1 is missing and the timer display fix.

Timing Practice is its own download, Zero Records-Timing Practice: a Fabric
mod that carries this pack with Timing Practice added and loads it by itself.

## Removing it

Run `/function zeroboard:settings/restore_chain_length` before you take the pack
out. The predictor raises maxCommandChainLength and that puts it back.

Zero Natural End's terrain is built in: turn on Natural Terrain on the Run
Settings page and every spawn loads real End terrain that matches it instead of
Mescht's stand-in, blended into his island. Don't install Zero Natural End next
to this, it's only for running the base map without Records.
