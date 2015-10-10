source /etc/profile
export TASKDDATA=/home/ashwin/TASKDDATA
export MANPATH=$MANPATH:/usr/local/share/man/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PATH=/opt/darktable/bin:/usr/texbin:$PATH

function ExtendedDisplay {
xrandr --output LVDS1 --mode 1920x1080 --brightness 0.7 --pos 1920x0 --output HDMI1 --mode 1920x1080 --pos 0x0
}

function DuplicateDisplay {
xrandr --output LVDS1 --brightness 0.7 --mode 1920x1080 --pos 0x0 --output HDMI1 --mode 1920x1080 --pos 0x0
}

function SingleDisplay {
xrandr --output LVDS1 --mode 1920x1080 --brightness 0.7 --pos 0x0 --output HDMI1 --off
}

function Slay {
pgrep $1 | xargs kill -9
}

function CreateAVI {
ffmpeg -i $1.MOV -c:v libx264 -c:a mp3 -preset slow $1.avi
}

function CreateMutedScaledAVI {
ffmpeg -i $1.MOV -c:v libx264 -vf scale=-1:$2  -preset slow -qp 22 -an  $1_$2p.avi
}

function BatchCreateScaledAVI {
   for fn in $( ls | grep MOV | sed -e 's/\.MOV\*//g' ) ; do CreateMutedScaledAVI  "$fn" 540 ; done
}

function BatchCreateAVI {
   for fn in $( ls | grep MOV | sed -e 's/\.MOV\*//g' ) ; do CreateAVI "$fn" ; done
}

function SlideShow {
feh -FD $1
}

alias TouchOff='synclient TouchpadOff=1'
alias TouchOn='synclient TouchpadOff=0'

function setBrighness {
xrandr --output LVDS1 --brightness $1
}

function PowerSavingMode {
for cpu in /sys/devices/system/cpu/cpu?/cpufreq/scaling_governer; do
   echo "powersave" > $cpu
done
}

function OnDemandMode {
for cpu in /sys/devices/system/cpu/cpu?/cpufreq/scaling_governer; do
   echo "ondemand" > $cpu
done
}
export LIBVA_DRIVER_NAME=i965
export LIBVA_DRIVERS_PATH=/usr/local/lib/dri

alias in="task add proj:Inbox +inbox"

#if [ -e /usr/share/terminfo/x/xterm-256color ]; then
   #export TERM='xterm-256color'
#else
   #export TERM='xterm'
#fi

function getSong {
pushd ~/Music/youtube
youtube-dl -f141 $1
popd
}
