import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.ManageDocks
import System.IO
import XMonad.Layout.Spacing

myWorkspaces::[String]
myWorkspaces = ["1:home", "2:dev", "3:web", "4", "5", "6", "7", "8", "9"]

myManageHook = composeAll
    [ className =? "Firefox"       --> doShift "3:web"
    , className =? "Gimp"           --> doFloat
    , className =? "Emacs"           --> doShift "2:dev"
    ]


main :: IO()               
main = do
     xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
     xmonad $ def
            { modMask = mod4Mask
            , terminal = "urxvtc"
            , borderWidth = 5
            , logHook = dynamicLogWithPP $ xmobarPP {
                ppOutput = hPutStrLn xmproc
                , ppTitle = xmobarColor "green" "" . shorten 50
                }
            , workspaces = myWorkspaces
            , layoutHook= smartSpacing 5 $ avoidStruts $ layoutHook def
            , manageHook= myManageHook
            , handleEventHook = docksEventHook <+> handleEventHook def
            }
