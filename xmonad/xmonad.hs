import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

import XMonad.Layout.Gaps
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops


layout = avoidStruts $ gaps [(U, 31)] $ smartSpacing 8 $ spiral (6/7)

keybinds =
  [ ("M-p", spawn "rofi -show drun")
  , ("M-.", spawn "rofimoji")
  , ("M-f", spawn "firefox")
  ]

manager :: ManageHook
manager = composeAll
  [ resource  =? "desktop_window" --> doIgnore
  , resource  =? "kdesktop" --> doIgnore
  , className =? "MPlayer" --> doFloat
  ]

startup :: X ()
startup = do
  spawnOnce "eww open bar"
  spawnOnce "~/.fehbg"
  spawnOnce "picom -b"

main :: IO ()
main = xmonad . docks . ewmhFullscreen . ewmh $ defaults `additionalKeysP` keybinds

defaults = def
  { modMask            = mod4Mask
  , terminal           = "alacritty"
  , workspaces         = ["dev", "www", "sys", "misc"]
  , focusFollowsMouse  = True
  , clickJustFocuses   = False
  , borderWidth        = 0
  , handleEventHook    = mempty
  , layoutHook         = layout
  , manageHook         = manager
  , startupHook        = startup
  }
