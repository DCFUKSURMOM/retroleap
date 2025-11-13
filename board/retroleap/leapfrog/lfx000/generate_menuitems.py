#!/usr/bin/python3

import os
import sys
from collections import namedtuple


App = namedtuple("App", "section name description path extensions icon selectorbrowser")

core_path = "/usr/lib/libretro/"
bin_path = "/usr/bin/"

apps = [
  # Libretro cores. gmenunx will detect these and run retroarch appropriately.
  App("emulators", "Atari800", "Atari 800 Emulator", f"{core_path}atari800_libretro.so", ".atr,.atx,.pro,.dcm,.xfd,.rom,.bin,.car,.zip", "gbc.png", True),
  App("emulators", "CATSFC", "SNES Emulator", f"{core_path}catsfc_libretro.so", ".smc,.zip", 'pocketsnes.png', True),
  App("emulators", "FCEUmm", "NES Emulator", f"{core_path}fceumm_libretro.so", ".nes,.zip", "fceux.png", True),
  App("emulators", "gpsp", "GBA Emulator", f"{core_path}gpsp_libretro.so", ".gba,.zip", "gbc.png", True),
  App("emulators", "imame", "MAME Emulator", f"{core_path}imame4all_libretro.so", ".zip", "mame4all.png", True),
  App("emulators", "PicoDrive", "MegaDrive/Genesis Emulator", f"{core_path}picodrive_libretro.so", ".md,.zip", "picodrive.png", True),
  App("emulators", "PocketSNES", "SNES Emulator", f"{core_path}pocketsnes_libretro.so", ".smc,.zip", 'pocketsnes.png', True),
  App("emulators", "QuickNES", "NES Emulator",  f"{core_path}quicknes_libretro.so", ".nes,.zip", 'fceux.png', True),

  # Standalone games (lf1000)
  App("games", "OhBoy", "Gameboy Emulator",  f"{bin_path}ohboy", ".zip,.gb,.gbc", 'ohboy.png', True),
  App("games", "PicoDrive", "MegaDrive/Genesis Emulator (standalone)", f"{bin_path}PicoDrive", ".md,.zip", "picodrive.png", True),
  App("games", "PocketSNES", "SNES Emulator (standalone)", f"{bin_path}PocketSNES", ".smc,.zip", "pocketsnes.png", True),
  App("games", "Retroarch", "Retroarch (main menu)", f"{bin_path}retroarch", "", "generic.png", False),
  App("games", "snes9x4d", "SNES emulator (standalone)", f"{bin_path}snes9x4d", ".smc,.zip", "pocketsnes.png", True),

  # Applications (terminal, etc)
  App("applications", "st-sdl", "Terminal Emulator", f"{bin_path}st", "", "terminal.png", False),
  # TODO: Add a section for "system" or something similar.
  # TODO: Figure out how to get tslib to not need the hardcoded input path, or set it as a global elsewhere.
  App("applications", "ts_calibrate", "Calibrate Touchscreen", f"{bin_path}ts_calibrate", "", "glutexto.png", False),
  App("applications", "ts_test", "Test Touchscreen", f"{bin_path}ts_test", "", "tv.png", False)


]

buildroot_root = sys.argv[1]


for a in apps:
    destpath = os.path.join(buildroot_root, f"configs/.gmenunx/sections/{a.section}")
    os.makedirs(destpath, exist_ok=True)
    with(open(f"{destpath}/{a.name.lower()}", 'w') as f):
        f.write(
           f'''title={a.name}
description={a.description}
icon=skin:icons/{a.icon}
exec={a.path}
volume=1
wrapper=true
'''
        )
        if a.selectorbrowser:
            f.write(
                f'''selectordir=/roms/
selectorfilter={a.extensions}
selectorbrowser=true
''')
