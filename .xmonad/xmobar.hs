-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "-*-Inconsolata-*-13-*-*-*-*-*-*-*",
    bgColor = "#2b2b2b",
    fgColor = "#8fb28f",
--    position = Static { xpos = 1920, ypos = 0, width = 1800, height = 16 },
    lowerOnStart = True,
    commands = [
        Run Weather "KNYC" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Battery ["-L","25","-H","75","--low","red" ,"--high","green"] 600,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run DynNetwork ["-L","0","-H","32","--normal","green","--high","red"] 100,
        Run Com "dropbox" ["status"] "dropbox" 15,
        Run Date "%a %b %_d %l:%M" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %multicpu% |  %memory%  | %swap% |  %dynnetwork%| %battery%| %dropbox%   <fc=#FFFFCC>%date%</fc>   %KNYC%"
}
