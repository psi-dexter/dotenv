hdiutil create -o /tmp/HighSierra.cdr -size 5200m -layout SPUD -fs HFS+J
hdiutil attach /tmp/HighSierra.cdr.dmg -noverify -mountpoint /Volumes/install_build
sudo /Volumes/Install\ macOS\ Catalina/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/install_build
hdiutil detach /Volumes/Install\ macOS\ Catalina
mv /tmp/HighSierra.cdr.dmg ~/Desktop/InstallSystem.dmg
hdiutil convert ~/Desktop/InstallSystem.dmg -format UDTO -o ~/Desktop/HighSierra.iso
mv ~/Desktop/HighSierra.iso.cdr ~/Desktop/HighSierra.iso
rm ~/Desktop/InstallSystem.dmg