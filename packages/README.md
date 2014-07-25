# packages.bash
The script will recursively search the sub folders looking for a structure that conforms to my PKG template. It
uses the built-in Apple tools pkgutil and productbuild.

		Example:

		YOURSEARCHPATH
		|-- YOURAPPTOPACKAGE
		|   |-- root
		|   |   |-- Applications
		|   |   +-- Library
		|   |-- scripts
		|       |-- postinstall
		|       +-- preinstall
		+-- log
