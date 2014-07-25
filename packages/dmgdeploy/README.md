# dmgdeploy
Example deployment via a disk image.

Summary:
- drops dmgdeploy.dmg into /tmp
- mounts dmgdeploy.dmg (nobrowse)
- loops through all PKG files in the dmgdeploy.dmg mounted volume and installs them
- unmounts dmgdeploy.dmg

		Example:

		YOURSEARCHPATH
		|-- YOURAPPTOPACKAGE
		|   |-- root
		|   |   |-- tmp
		|   |        |- dmgdeploy.dmg
		|   |
		|   |-- scripts
		|       |-- postinstall
		|       +-- preinstall
		+-- log

Just make sure when you created dmgdeploy.dmg that its volume name is dmgdeploy or alternatively change your postinstall scripts.

postinstall is very minimal here... doesn't take into account spaces in filenames etc and there is no error checking.