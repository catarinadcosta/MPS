TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = mps
# mps.dbd will be created and installed
DBD += mps.dbd

# mps.dbd will be made up from these files:
mps_DBD += base.dbd
mps_DBD += asyn.dbd 
mps_DBD += stream.dbd
mps_DBD += drvAsynIPPort.dbd
mps_DBD += calc.dbd
# Include dbd files from all support applications:
#mps_DBD += xxx.dbd
mps_DBD += asSupport.dbd
# Add all the support libraries needed by this IOC
#mps_LIBS += xxx
mps_LIBS += asyn
mps_LIBS += stream
mps_LIBS += autosave
mps_LIBS += calc
# mps_registerRecordDeviceDriver.cpp derives from mps.dbd
mps_SRCS += mps_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
mps_SRCS_DEFAULT += mpsMain.cpp
mps_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#mps_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
mps_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

