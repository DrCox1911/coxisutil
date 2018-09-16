# CoxisUtil - Basic Lua-Functions for modding Project Zomboid

This utility mod has no purpose on its own!

Current function overview:
  - CoxisUtil.readINI(_modID, _filename): reads in an .ini-File shipped with a mod. The return value of this function is a 2D-table, first dimension holds all the sections, the second dimension all the keys from that sections
  -CoxisUtil.writeINI(_modID, _filename, _createIfNull, _append, _inidata): writes a table formated as an ini to a file
  - CoxisUtil.printDebug(_module, _string): Neatly formats the output for various debug purposes on the console
  - CoxisUtil.okModal(_text, _centered, _width, _height, _posX, _posY, _func): Pretty much a complete rip-off from the awesome RoboMat, only change is the "_func" parameter, that fires when the user clicks OK
  -CoxisUtil.tableContainsKey(_table, _key): checks the given table if the _key is present, returns the value of the key or nil if not present
