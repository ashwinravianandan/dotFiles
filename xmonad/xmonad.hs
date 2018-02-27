import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.ManageDocks
import System.IO
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers

myWorkspaces::[String]
myWorkspaces = ["1:home", "2:dev", "3:web", "4", "5", "6", "7", "8", "9"]

myManageHook = composeAll
    [ className =? "Firefox"       --> doShift "3:web"
    , className =? "Gimp"           --> doFloat
    , className =? "Emacs"           --> doShift "2:dev"
    , isFullscreen --> doFullFloat
    ]
myGaps = gaps [(U,20), (D, 10), (L,5), (R,5)]

myLayout = tiled ||| Mirror tiled ||| Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio
 
    -- The default number of windows in the master pane
    nmaster = 1
 
    -- Default proportion of screen occupied by master pane
    ratio   = 3/5
 
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

main :: IO()               
main =  do
     xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
     xmonad $ ewmh def
            { modMask = mod4Mask
            , terminal = "urxvtc"
            , borderWidth = 3
            , logHook = dynamicLogWithPP $ xmobarPP {
                ppOutput = hPutStrLn xmproc
                , ppTitle = xmobarColor "green" "" . shorten 50
                }
            , workspaces = myWorkspaces
            , layoutHook=  smartSpacing 5 $ myGaps $ avoidStruts  myLayout
            , manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> myManageHook <+> manageHook def
            --, manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
            , handleEventHook = handleEventHook def <+> fullscreenEventHook
            }
