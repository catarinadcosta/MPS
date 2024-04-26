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
drvAsynIPPortConfigure "qdx41","120.10.10.250:4001" 
drvAsynIPPortConfigure "qdy41","120.10.10.250:4002" 

## Load record instances
dbLoadRecords("db/sys9100.db","USER=QDX41,HWUNIT=qdx41")
dbLoadRecords ("db/restoreall.db","USER=QDX41,HWUNIT=qdx41")
dbLoadRecords("db/sys9100.db","USER=QDY41,HWUNIT=qdy41")
dbLoadRecords ("db/restoreall.db","USER=QDY41,HWUNIT=qdy41")
dbLoadRecords("db/common.db","USER=ALL")



#Autosave
 set_savefile_path("${TOP}/autoSaveRestore")
 set_requestfile_path("${TOP}/autoSaveRestore")
 set_pass0_restoreFile("pvsaveQD41XY.sav")
 #set_pass1_restoreFile("pvsaveQD2XY.sav")


cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=linacp206"
create_monitor_set("pvsaveQD41XY.req",2) #2 second







cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=linacp206"
