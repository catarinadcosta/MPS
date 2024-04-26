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
drvAsynIPPortConfigure "bm1","120.10.10.253:4001" 
drvAsynIPPortConfigure "bm2","120.10.10.253:4002" 

## Load record instances
dbLoadRecords("db/sys9100.db","USER=BM1,HWUNIT=bm1")
dbLoadRecords ("db/restoreall.db","USER=BM1,HWUNIT=bm1")
dbLoadRecords("db/sys9100.db","USER=BM2,HWUNIT=bm2")
dbLoadRecords ("db/restoreall.db","USER=BM2,HWUNIT=bm2")
dbLoadRecords("db/common.db","USER=ALL")


#Autosave
 set_savefile_path("${TOP}/autoSaveRestore")
 set_requestfile_path("${TOP}/autoSaveRestore")
 set_pass0_restoreFile("pvsaveBM12.sav")
 #set_pass1_restoreFile("pvsaveQD1XY.sav")



cd "${TOP}/iocBoot/${IOC}"
iocInit



## Start any sequence programs
#seq sncxxx,"user=linacp206"
create_monitor_set("pvsaveBM12.req",2) #2 second
