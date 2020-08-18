#!/system/bin/sh
# MUST RUN AS ROOT
dir="/data/local/tmp/forcer"

echo "Welcome to fucking force updater"
cd /data/local/tmp

if [[ ! -e $dir ]]; then
    echo "No $dir directory found, creating"
    mkdir -p $dir
elif [[ ! -d $dir ]]; then
    echo "$dir already exists but is not a directory" 1>&2
    exit 1
fi

chmod 775 /data/local/tmp/forcer

cd $dir/
echo "Removing every .apk file"
rm *.apk

# echo "Downloading full.apk"
# /system/bin/curl -k -L --progress-bar <http> -o pogo.apk
echo "Download PogoDroid too!"
/system/bin/curl -k -L --progress-bar https://www.maddev.de/apk/PogoDroid.apk -o pogodroid.apk
echo "RGC too!"
/system/bin/curl -k -L --progress-bar https://raw.githubusercontent.com/Map-A-Droid/MAD/master/APK/RemoteGpsController.apk -o rgc.apk
echo "Killing PogoDroid, RGC and Pokemon GO"
/system/bin/killall com.mad.pogodroid
/system/bin/am force-stop de.grennith.rgc.remotegpscontroller
/system/bin/killall com.nianticlabs.pokemongo

#chmod 774 /data/local/tmp/forcer/pogo.apk
chmod 775 /data/local/tmp/forcer/pogodroid.apk
chmod 775 /data/local/tmp/forcer/rgc.apk

echo "Installing everything"
# echo "pogo.apk"
# su -c 'pm install -r /data/local/tmp/forcer/pogo.apk'
echo "pogodroid.apk"
su -c 'pm install -r /data/local/tmp/forcer/pogodroid.apk'
echo "rgc.apk"
su -c 'pm install -r /data/local/tmp/forcer/rgc.apk'
echo "Done, rebooting"
reboot
