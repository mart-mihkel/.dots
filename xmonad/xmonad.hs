import XMonad

import XMonad.Util.Themes
import XMonad.Util.SpawnOnce

import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops

myLayout = avoidStruts $ gaps [(U, 46), (D, 16), (L, 16), (R, 16)] $ smartSpacing 8 $ tiled
  where
    tiled = Tall 1 (1/2) (3/100)

myManageHook :: ManageHook
myManageHook = composeAll
  [ resource  =? "desktop_window" --> doIgnore
  , resource  =? "kdesktop" --> doIgnore
  , className =? "MPlayer" --> doFloat
  ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "feh --bg-fill --no-fehbg ~/dotfiles/walls/a_person_riding_a_bicycle_on_a_hill_with_sunflowers.jpeg"
  spawnOnce "eww open bar"
  spawnOnce "picom -b"

main :: IO ()
main = xmonad . docks . ewmhFullscreen . ewmh $ defaults

defaults = def
  { modMask            = mod4Mask
  , terminal           = "alacritty"
  , workspaces         = ["dev", "www", "sys", "misc"]
  , focusFollowsMouse  = True
  , clickJustFocuses   = False
  , borderWidth        = 0
  , handleEventHook    = mempty
  , layoutHook         = myLayout
  , manageHook         = myManageHook
  , startupHook        = myStartupHook
  }
