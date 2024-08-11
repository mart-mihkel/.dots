import XMonad

import XMonad.Util.Themes
import XMonad.Util.SpawnOnce

import XMonad.Layout.Spacing

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops

color0, color1 :: String
color0 = "#8a999e"
color1 = "#545d75"

myLayout = smartSpacing 8 $ avoidStruts $ tiled
  where
    tiled = Tall 1 (1/2) (3/100)

myManageHook :: ManageHook
myManageHook = composeAll
  [ className =? "MPlayer" --> doFloat
  , resource  =? "desktop_window" --> doIgnore
  , resource  =? "kdesktop" --> doIgnore ]

myMobarPP :: PP
myMobarPP = def
    { ppCurrent         = xmobarColor color0 "" . wrap "[" "]"
    , ppHidden          = xmobarColor color1 ""
    , ppHiddenNoWindows = const ""
    , ppOrder           = \[ws, _, _] -> [ws]
    }

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "feh --bg-fill --no-fehbg ~/dotfiles/walls/a_person_riding_a_bicycle_on_a_hill_with_sunflowers.jpeg"
  spawnOnce "picom -b"

main :: IO ()
main = xmonad
  . ewmhFullscreen
  . ewmh
  . withEasySB (statusBarProp "xmobar ~/.config/xmonad/xmobarrc" (pure myMobarPP)) defToggleStrutsKey
  $ def
  { modMask            = mod4Mask
  , terminal           = "alacritty"
  , workspaces         = ["dev", "www", "misc", "4", "5", "6", "7", "8", "9"]
  , focusFollowsMouse  = True
  , clickJustFocuses   = False
  , borderWidth        = 0
  , focusedBorderColor = color0
  , normalBorderColor  = color1
  , handleEventHook    = mempty
  , layoutHook         = myLayout
  , manageHook         = myManageHook
  , startupHook        = myStartupHook
  }
