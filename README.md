# CoxisUtil - Basic Lua-Functions for modding Project Zomboid

This utility mod has no purpose on its own!

Current function overview:
  - CoxisUtil.readINI(_modID, _filename): reads in an .ini-File shipped with a mod. The return value of this function is a 2D-table, first dimension holds all the sections, the second dimension all the keys from that sections
  - CoxisUtil.printDebug(_module, _string): Neatly formats the output for various debug purposes on the console
  - CoxisUtil.okModal(_text, _centered, _width, _height, _posX, _posY, _func): Pretty much a complete rip-off from the awesome RoboMat, only change is the "_func" parameter, that fires when the user clicks OK
