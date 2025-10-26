# Design Document for Power Swing ReMixed
---
# Game mechanics
## Swing types

- Bunt
Player hits ball upwards for a better second hit
Set ball speed to 0 on X axis, 30 on Y with timer for fall

- Charge
Player gives up reaction time for guaranteed hit type
Set ball speed according to hit type

- Whiff
Player gets hit
Reaction time null
Loss fx cue

- Light
Set ball speed to minimum
High reaction time, minimal fx cue

- Meduium
Set ball speed to medium
Base reaction time, average fx cue

- Heavy
Set ball speed to high
Low reaction time, big fx cue

- Atomic
Set ball speed to maximum
Lowest reaction time, biggest fx cue

# Swing selection
Sets selected character to a swing style

- Dynamic
Average, can bunt and charge

- Time-based
Stronger, time-based hits only, no bunt or charge

-Slugger
- Strongest, slowest hits, no Time-based hits or bunt

---
# Stages and hazards
- Grass Field
- Hazardless field of grass like the original Power Ball
- Cliffside
- Narrow cliff
- Randomly swooping bird (both sides, can be toggled)
- Can be hit to launch into other player
---
# Features
## Stage select
- Stage select with thumbnails
- Player selection
- Starting BGM selection
## Hazard toggle
- Turns stage hazards off (Like bird in cliff stage)
## Stage variations
- Slight edits with different time of day or weather
## Classic mode
- Rotate between characters at random in grass stage
## Versus
- Choose any character, stage and BGM
---
# Characters

## Char (Ethan)
- All-rounder

## Char2 (Kevin)
- Same stats, visually different (Backwards cap etc) to require less accessibility changes

## Fist (Martial Artist)
- Fast hits, no charge

## Thug (Hooligan)
- Harder hits overall, no charge

## Dan (Mr. Sun)
- Has pen in hand
- Name and pen is a reference to D-SuN

## Radika
- Uses Martial Artist animations with different VFX
- Fast hits
- Can charge

# Misc features

## Playlist mode
- Loads a defined list of tracks that can be use anywhere in Versus or Singleplayer (Minus Classic)
