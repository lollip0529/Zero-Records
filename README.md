# Zero Records

Add-on for Mescht's Zero Practice (1.2.1 and 1.2.2) and the Zero mode in Dibedy's MCSR Practice 2.0.0.

Roughly what it adds:

- a Zero Cycle Archive that keeps every kill: times, approach, angle, spawn
- a flydown predictor: right after the kill it simulates the rest of the flight and prints the predicted finish time, so you don't have to wait for it for records to count
- extra settings pages on top of the base ones: custom spawns pool, timing tracker, reset info, subrotations, left and right towers, reset info + Vanilla crystal strafes for ground zero
- a Natural Terrain option next to Spawn: real End terrain around every spawn instead of stand-in cages (off by default)
- spawns up to Buried 66 (seed -78224660128093), and Natural Distribution rolls each spawn about as often as real seeds do: Open 54.3%, Overhang 17.3%, o56 9.3%, down to o66 at about 1 in 570 billion

## Installing

Drop the zip (or the folder) into the world's `datapacks` folder and make sure it sits above the base Zero pack, and above LobbySystem if you're on dibedy's map. Then `/reload`. Don't remove the base packs, this only overrides parts of them.

1.2.1 gets the path tracer missing and the timer display fix.

Timing Practice is its own download, Zero Records-Timing Practice: a Fabric
mod that carries this pack with Timing Practice added and loads it by itself.

## Removing it

Run `/function zeroboard:settings/restore_chain_length` before you take the pack out. The predictor raises maxCommandChainLength and that puts it back.
