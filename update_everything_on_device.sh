#!/system/bin/sh
dir="forcer"

echo "Welcome to fucking force updater"
cd /storage/emulated

if [[ ! -e $dir ]]; then
    echo "No $dir directory found, creating"
    mkdir $dir
elif [[ ! -d $dir ]]; then
    echo "$dir already exists but is not a directory" 1>&2
    exit 1
fi

chmod 775 /storage/emulated/forcer

cd $dir/
echo "Removing every .apk file"
rm *.apk

# echo "Downloading full.apk"
# /system/bin/curl -k -L --progress-bar <http> -o pogo.apk
echo "Download PogoDroid too!"
/system/bin/curl -k -L --progress-bar https://www.maddev.de/apk/PogoDroid.apk -o pogodroid.apk
echo "RGC too!"
/system/bin/curl -k -L --progress-bar https://raw.githubusercontent.com/Map-A-Droid/MAD/master/APK/RemoteGpsController.>
echo "Killing PogoDroid, RGC and Pokemon GO"
/system/bin/killall com.mad.pogodroid
/system/bin/am force-stop de.grennith.rgc.remotegpscontroller
/system/bin/killall com.nianticlabs.pokemongo

#chmod 774 /storage/emulated/pogo.apk
chmod 774 /storage/emulated/forcer/pogodroid.apk
chmod 774 /storage/emulated/forcer/rgc.apk

echo "Installing everything"
# echo "pogo.apk"
# pm install -r pogo.apk
echo "pogodroid.apk"
pm install -r pogodroid.apk
echo "rgc.apk"
pm install -r rgc.apk
echo "Done, rebooting"
reboot
