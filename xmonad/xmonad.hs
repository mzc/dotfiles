
import XMonad
import System.Exit
import XMonad.Hooks.DynamicLog 

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Actions.CycleWS

import XMonad.Layout.PerWorkspace (onWorkspace, onWorkspaces)
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimpleFloat
import XMonad.Layout.IM
import Data.Ratio ((%))
import XMonad.Layout.Grid

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.InsertPosition

main = xmonad =<< statusBar myBar myPP toggleStructsKey myConfig

myBar = "xmobar"
myPP = xmobarPP 
     { ppLayout          = (\ x                    -> case x of
                            "Full"                 -> "[F]"
                            "Tabbed Simplest"      -> "[T]"
                            "ResizableTall"        -> "[|]"
                            "Mirror ResizableTall" -> "[-]"
                            "IM Grid"              -> "[+]"
                            "Simple Float"         -> "[~]"
                            _                      -> x )
     , ppCurrent         = xmobarColor "#66D9EF" "" . wrap "" "" -- Blue
     , ppHidden          = xmobarColor "#A6E22E" ""              -- Green
     , ppHiddenNoWindows = xmobarColor "#CCCCC6" ""              -- Dark White
     , ppVisible         = xmobarColor "#F8F8F2" ""              -- Bright White
     , ppUrgent          = xmobarColor "#FD971F" ""              -- Yellow
     , ppWsSep           = "<fc=grey>|</fc>"
     , ppSep             = " "
     }

toggleStructsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

myConfig = defaultConfig 
     { modMask            = myModMask
     , focusFollowsMouse  = myFocusFollowsMouse
     , terminal           = myTerminal
     , workspaces         = myWorkspaces
     , keys               = myKeys
     , normalBorderColor  = myNormalBorderColor
     , focusedBorderColor = myFocusedBorderColor
     , layoutHook         = myLayoutHook
     , manageHook         = myManageHook
     }
           
myModMask            = mod4Mask
myWorkspaces         = ["1:term","2:emacs","3:email","4:www","5:ebook","6:app","7:im", "8:virt", "9:dual"]
myTerminal           = "urxvt"
myNormalBorderColor  = "grey"
myFocusedBorderColor = "yellow"
myFocusFollowsMouse  = False

myManageHook = insertPosition Below Newer

--- My Theme For Tabbed layout
myTheme = defaultTheme { decoHeight           = 16
                        , activeColor         = "#a6c292"
                        , activeBorderColor   = "#a6c292"
                        , activeTextColor     = "#000000"
                        , inactiveBorderColor = "#000000"
                        }

myLayoutHook = onWorkspace "2:emacs" emacsLayout
             $ onWorkspace "3:email" emailLayout
             $ onWorkspace "4:www"   wwwLayout
             $ onWorkspace "5:ebook" ebookLayout
             $ onWorkspace "6:app"   appLayout
             $ onWorkspace "7:im"    imLayout
             $ standardLayouts
    where
        standardLayouts = tiled                 ||| tabbedLayout
        
        emacsLayout     = Mirror bigMasterTiled ||| tabbedLayout
        emailLayout     = Mirror bigMasterTiled ||| tabbedLayout
        wwwLayout       = Mirror bigMasterTiled ||| tabbedLayout
        ebookLayout     = Mirror bigMasterTiled ||| tabbedLayout
        appLayout       = floatLayout           ||| tabbedLayout
        imLayout        = withIM (1%7) (ClassName "Tkabber") Grid ||| tabbedLayout

        tabbedLayout    = noBorders (tabbed shrinkText myTheme)
        full 	        = noBorders Full
        tiled           = smartBorders (ResizableTall 1 (2/100) (1/2) [])
        bigMasterTiled  = smartBorders (ResizableTall 1 (2/100) (2/3) [])
        floatLayout     = simpleFloat

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_d     ), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
    , ((modm .|. shiftMask, xK_d     ), spawn "gmrun")
    , ((modm .|. shiftMask, xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm,               xK_t     ), spawn "synclient TouchpadOff=0")
    , ((modm .|. shiftMask, xK_t     ), spawn "synclient TouchpadOff=1")]

    ++

    -- Handle layouts of workspace
    [ ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp)

    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm,               xK_comma ), sendMessage (IncMasterN 1))
    , ((modm,               xK_period), sendMessage (IncMasterN (-1)))
    
    , ((modm,               xK_m     ), windows W.focusMaster)
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm,               xK_f     ), withFocused $ windows . W.sink)]


    ++

    -- Switch between workspaces
    [((m .|. modm, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    ++

    -- Switch between Screens
    [ ((modm,               xK_p), prevScreen)
    , ((modm,               xK_n), nextScreen)
    , ((modm .|. shiftMask, xK_p), shiftPrevScreen)
    , ((modm .|. shiftMask, xK_n), shiftNextScreen)
    , ((modm,               xK_s), swapNextScreen)]
    
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
    | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
    , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

    ++

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
    [ ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))
    , ((modm,               xK_q), spawn "xmonad --recompile; xmonad --restart")]

    ++
    
    -- Application
    [ ((modm .|. controlMask, xK_e), spawn "emacsclient -c -a \"\"")
    , ((modm .|. controlMask, xK_w), spawn "google-chrome")]

