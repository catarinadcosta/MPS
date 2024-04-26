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
drvAsynIPPortConfigure "qdx10","120.10.10.254:4008" 
drvAsynIPPortConfigure "qdy10","120.10.10.254:4009" 

## Load record instances
dbLoadRecords("db/sys9100.db","USER=QDX10,HWUNIT=qdx10")
dbLoadRecords ("db/restoreall.db","USER=QDX10,HWUNIT=qdx10")
dbLoadRecords("db/sys9100.db","USER=QDY10,HWUNIT=qdy10")
dbLoadRecords ("db/restoreall.db","USER=QDY10,HWUNIT=qdy10")
dbLoadRecords("db/common.db","USER=ALL")




#Autosave
 set_savefile_path("${TOP}/autoSaveRestore")
 set_requestfile_path("${TOP}/autoSaveRestore")
 set_pass0_restoreFile("pvsaveQD10XY.sav")
 #set_pass1_restoreFile("pvsaveQD2XY.sav")


cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=linacp206"
create_monitor_set("pvsaveQD10XY.req",2) #2 second


