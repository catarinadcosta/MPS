#!../../bin/linux-x86_64/mps

#- You may have to change mps to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/mps.dbd"
mps_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/mps.db","user=linacp206")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=linacp206"
