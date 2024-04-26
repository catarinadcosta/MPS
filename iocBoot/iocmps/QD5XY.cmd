#!../../bin/linux-x86_64/mps
## contains quadrupole QDX41 and QDY41
#- You may have to change mps to something else
#- everywhere it appears in this file

< envPaths
epicsEnvSet ("STREAM_PROTOCOL_PATH","$(TOP)/db")
cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/mps.dbd"
mps_registerRecordDeviceDriver pdbbase
drvAsynIPPortConfigure "qdx5","120.10.10.253:4003" 
drvAsynIPPortConfigure "qdy5","120.10.10.253:4004" 

## Load record instances
dbLoadRecords("db/sys9100.db","USER=QDX5,HWUNIT=qdx5")
dbLoadRecords ("db/restoreall.db","USER=QDX5,HWUNIT=qdx5")
dbLoadRecords("db/sys9100.db","USER=QDY5,HWUNIT=qdy5")
dbLoadRecords ("db/restoreall.db","USER=QDY5,HWUNIT=qdy5")
dbLoadRecords("db/common.db","USER=ALL")


#Autosave
 set_savefile_path("${TOP}/autoSaveRestore")
 set_requestfile_path("${TOP}/autoSaveRestore")
 set_pass0_restoreFile("pvsaveQD5XY.sav")
 #set_pass1_restoreFile("pvsaveQD2XY.sav")


cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=linacp206"
create_monitor_set("pvsaveQD5XY.req",2) #2 second
