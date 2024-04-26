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
drvAsynIPPortConfigure "qdx1","120.10.10.252:4001" 
drvAsynIPPortConfigure "qdy1","120.10.10.252:4002" 

## Load record instances
dbLoadRecords("db/sys9100.db","USER=QDX1,HWUNIT=qdx1")
dbLoadRecords("db/sys9100.db","USER=QDY1,HWUNIT=qdy1")
dbLoadRecords("db/common.db","USER=ALL")
cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=linacp206"
