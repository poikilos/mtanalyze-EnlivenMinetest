#!/bin/sh
cd $HOME
MT_MY_WEBSITE_PATH=/var/www/html/minetest
if [ -d "$HOME/minetest-stuff/minetest-chunkymap" ]; then
  #remove deprecated path:
  rm -Rf $HOME/minetest-stuff/minetest-chunkymap
fi
CHUNKYMAP_INSTALLER_PATH=$HOME/Downloads/minetest-chunkymap
if [ ! -d "$HOME/Downloads/minetest-chunkymap" ]; then
  echo "please run install-chunkymap-on-ubuntu-from-web.sh or update-chunkymap-installer-only.sh first.";
else
#else run everything from here down


#MINETEST_UTIL=$HOME/minetest/util
#CHUNKYMAP_DEST=$MINETEST_UTIL
CHUNKYMAP_DEST=$HOME/chunkymap


#cd $HOME/Downloads
#rm -f $HOME/minetestmapper-numpy.py
#wget https://github.com/spillz/minetest/raw/master/util/minetestmapper-numpy.py
#cp -f "$CHUNKYMAP_INSTALLER_PATH/minetestmapper-numpy.py" "$HOME/minetest/util/minetestmapper-numpy.py"
#if [ ! -d "$CHUNKYMAP_DEST" ]; then
#  mkdir "$CHUNKYMAP_DEST"
#fi
#if [ ! -d "$CHUNKYMAP_DEST/unused/" ]; then
#  mkdir "$CHUNKYMAP_DEST/unused/"
#fi
#NOTE: chmod +x is done last (see below)

mv -Rvf "$CHUNKYMAP_INSTALLER_PATH" "$CHUNKYMAP_DEST"
rm "$CHUNKYMAP_DEST/*.bat"
rm "$CHUNKYMAP_DEST/install-chunkymap-on-windows.py"

#region DEPRECATED
if [ ! -d "$CHUNKYMAP_DEST" ]; then



cp -f "$CHUNKYMAP_INSTALLER_PATH/chunkymap-regen.py" "$CHUNKYMAP_DEST/"
#chmod +x "$CHUNKYMAP_DEST/chunkymap-regen.py"

cp -f "$CHUNKYMAP_INSTALLER_PATH/README.md" "$CHUNKYMAP_DEST/"
#remove files place in dest by old version of installer script:
rm -f "$CHUNKYMAP_DEST/chunkymap-regen.sh"
rm -f "$CHUNKYMAP_DEST/chunkymap-regen-players.sh"
rm -f "$CHUNKYMAP_DEST/chunkymap-cronjob"
rm -f "$CHUNKYMAP_DEST/chunkymap-players-cronjob"
rm -f "$CHUNKYMAP_DEST/set-minutely-players-crontab-job.sh"
rm -f "$CHUNKYMAP_DEST/set-minutely-crontab-job.sh"
#install scripts:
cp -f "$CHUNKYMAP_INSTALLER_PATH/chunkymap-regen-loop.sh" "$CHUNKYMAP_DEST/"
#install not-recommended scripts:
cp -f "$CHUNKYMAP_INSTALLER_PATH/unused/chunkymap-regen.sh" "$CHUNKYMAP_DEST/unused/"
cp -f "$CHUNKYMAP_INSTALLER_PATH/unused/chunkymap-regen-players.sh" "$CHUNKYMAP_DEST/unused/"
cp -f "$CHUNKYMAP_INSTALLER_PATH/unused/chunkymap-cronjob" "$CHUNKYMAP_DEST/unused/"
cp -f "$CHUNKYMAP_INSTALLER_PATH/unused/chunkymap-players-cronjob" "$CHUNKYMAP_DEST/unused/"
cp -f "$CHUNKYMAP_INSTALLER_PATH/unused/set-minutely-players-crontab-job.sh" "$CHUNKYMAP_DEST/unused/"
cp -f "$CHUNKYMAP_INSTALLER_PATH/unused/set-minutely-crontab-job.sh" "$CHUNKYMAP_DEST/unused/"
if [ ! -d "$CHUNKYMAP_DEST/web" ]; then
	mkdir "$CHUNKYMAP_DEST/web"
fi
cp -Rf "$CHUNKYMAP_INSTALLER_PATH/web" "$CHUNKYMAP_DEST/"

#if [ ! -d "$CHUNKYMAP_DEST/chunkymap" ]; then
#  mkdir "$CHUNKYMAP_DEST/chunkymap"
#fi
cp -f "$CHUNKYMAP_INSTALLER_PATH/minetestmapper-expertmm.py" "$CHUNKYMAP_DEST/"
cp --no-clobber $CHUNKYMAP_INSTALLER_PATH/chunkymap-signals* "$CHUNKYMAP_DEST/"
cd "$CHUNKYMAP_INSTALLER_PATH"
python replace-with-current-user.py  # the py file only manipulates the minetest/util directory
# so chmod those files AFTER running the py above (since it rewrites them and therefore removes x attribute if present):



fi
#endregion DEPRECATED



chmod +x  "$CHUNKYMAP_DEST/chunkymap-regen-loop.sh"
chmod -x "$CHUNKYMAP_DEST/unused/chunkymap-regen.sh"
chmod -x "$CHUNKYMAP_DEST/unused/chunkymap-regen-players.sh"
chmod -x "$CHUNKYMAP_DEST/unused/chunkymap-cronjob"
chmod -x "$CHUNKYMAP_DEST/unused/set-minutely-crontab-job.sh"
chmod -x "$CHUNKYMAP_DEST/unused/set-minutely-players-crontab-job.sh"

#if [ -f "$HOME/update-chunkymap-on-ubuntu-from-web.sh" ]; then
cp -f "HOME/chunkymap/update-chunkymap-on-ubuntu-from-web.sh" "HOME/update-chunkymap-on-ubuntu-from-web.sh"
#fi
#cp -f "HOME/chunkymap/install-chunkymap-on-ubuntu-from-web.sh" "HOME/install-chunkymap-on-ubuntu-from-web.sh"
rm "HOME/install-chunkymap-on-ubuntu-from-web.sh"
rm "HOME/mapper-refresh-minetestserver.bat"
rm "HOME/mapper-refresh-minetestserver"

sudo apt-get install python-numpy python-pil python-leveldb
echo ""
echo "To see what needs to be in your $MT_MY_WEBSITE_PATH directory (if you don't use that directory, modify chunkymap-regen.py to use your directory):"
echo "cd $CHUNKYMAP_DEST/web"
echo ""
echo "To view helpful scripts:"
echo "cd $CHUNKYMAP_DEST"
echo ""
echo "To learn more about chunkymap:"
echo "nano $CHUNKYMAP_DEST/README.md"
echo
echo "To start now assuming configuration matches yours (see $CHUNKYMAP_INSTALLER_PATH/README.md before this):"
echo sh minetest/util/chunkymap-regen-loop.sh
echo
# NOTE: colors.txt should ALREADY be in $HOME/minetest/util


fi

