################################################################################
# Copyright 2011 by the Digital Aggregates Corporation, Colorado, USA
# Licensed under the terms in README.h
# Chip Overclock <coverclock@diag.com>
# http://www.diag.com/navigation/downloads/Desperadito
# This project is a subset of the much larger core project.
# http://www.diag.com/navigation/downloads/Desperado
# The source files are derived directly and unaltered from the core project.
# The core project contains the unit tests.
################################################################################

PROJECT=desperadito

CORE=Desperado
CORELC=desperado

SVN_URL=svn://graphite/$(PROJECT)/trunk/Desperadito
HTTP_URL=http://www.diag.com/navigation/downloads/Desperadito.html

TMP=/tmp

PLATFORM=Linux
TARGET=IA32

################################################################################
# LISTS
################################################################################

PHONY=# Make these targets every time regardless of dependencies.

TARGETS=# Make these targets for make all.

ARTIFACTS=# Remove these targets for make clean.

DELIVERABLES=# Remove these targets for make clobber.

ARCHIVABLE=# Include these targets in the archive or shared library.

################################################################################
# PROJECT
################################################################################

PROJECT_DIR=.
PROJECT_LIBS=.
PROJECT_LIB=lib$(PROJECT).so
PROJECT_INC=include

PROJECT_CDEFINES=\
 -DDESPERADO_TARGET_IS_$(TARGET) \
 -DDESPERADO_TARGET_NAME="\"$(TARGET)\"" \
 -DDESPERADO_PLATFORM_IS_$(PLATFORM) \
 -DDESPERADO_PLATFORM_NAME="\"$(PLATFORM)\""  \
 -DDESPERADO_PLATFORM_CLASS=$(PLATFORM) \
 -DDESPERADO_HAS_SYSLOG \
 -D_REENTRANT \
 -D_GNU_SOURCE

PROJECT_CPPFLAGS=-I$(PROJECT_INC) $(PROJECT_CDEFINES)
PROJECT_LDFLAGS=-L$(PROJECT_LIBS) -l$(PROJECT)

CC=gcc
CXX=g++
AR=ar
RANLIB=ranlib
STRIP=strip

CPPFLAGS=$(PROJECT_CPPFLAGS)
CFLAGS=-g
CXXFLAGS=-g
ARFLAGS=rcv
SOFLAGS=xv
LDFLAGS=-g $(PROJECT_LDFLAGS) -lpthread -lrt -lm

################################################################################
# DEFAULT
################################################################################

PHONY+=default

default:	all

################################################################################
# MANIFESTS
################################################################################

MANIFEST_H=\
 Begin.h \
 BufferInput.h \
 BufferOutput.h \
 CommonEra.h \
 CriticalSection.h \
 Constant.h \
 DataInput.h \
 Date.h \
 DateTime.h \
 DaylightSavingTime.h \
 DescriptorInput.h \
 DescriptorOutput.h \
 Desperado.h \
 DstAlways.h \
 DstEu.h \
 DstGeneric.h \
 DstNever.h \
 DstUs.h \
 DstUs1966.h \
 DstUs1986.h \
 DstUs2007.h \
 Dump.h \
 DumpInput.h \
 DumpOutput.h \
 End.h \
 Epoch.h \
 Exception.h \
 FileInput.h \
 FileOutput.h \
 Heap.h \
 Input.h \
 InputOutput.h \
 LeapSeconds.h \
 Linux.h \
 LocalTime.h \
 LogOutput.h \
 Logger.h \
 Mutex.h \
 Number.h \
 Object.h \
 Output.h \
 PathInput.h \
 PathOutput.h \
 Platform.h \
 Print.h \
 SyslogOutput.h \
 Ticks.h \
 Time.h \
 TimeStamp.h \
 TimeZone.h \
 Vintage.h \
 cxxcapi.h \
 assert.h \
 debug.h \
 errno.h \
 exceptions.h \
 generics.h \
 littleendian.h \
 lowtohigh.h \
 ready.h \
 release.h \
 stdarg.h \
 stdio.h \
 stdlib.h \
 string.h \
 target.h \
 types.h \
 int8_Number.h \
 int16_Number.h \
 int32_Number.h \
 int64_Number.h \
 uint8_Number.h \
 uint16_Number.h \
 uint32_Number.h \
 uint64_Number.h

MANIFEST_CPP=\
 BufferInput.cpp \
 BufferOutput.cpp \
 CommonEra.cpp \
 DataInput.cpp \
 Date.cpp \
 DateTime.cpp \
 DaylightSavingTime.cpp \
 DescriptorInput.cpp \
 DescriptorOutput.cpp \
 DstAlways.cpp \
 DstEu.cpp \
 DstGeneric.cpp \
 DstNever.cpp \
 DstUs.cpp \
 DstUs1966.cpp \
 DstUs1986.cpp \
 DstUs2007.cpp \
 Dump.cpp \
 DumpInput.cpp \
 DumpOutput.cpp \
 Epoch.cpp \
 FileInput.cpp \
 FileOutput.cpp \
 Heap.cpp \
 Input.cpp \
 InputOutput.cpp \
 LeapSeconds.cpp \
 Linux.cpp \
 LocalTime.cpp \
 LogOutput.cpp \
 Logger.cpp \
 Mutex.cpp \
 Number_int8.cpp \
 Number_int16.cpp \
 Number_int32.cpp \
 Number_int64.cpp \
 Number_uint8.cpp \
 Number_uint16.cpp \
 Number_uint32.cpp \
 Number_uint64.cpp \
 Object.cpp \
 Output.cpp \
 PathInput.cpp \
 PathOutput.cpp \
 Platform.cpp \
 PlatformApi.cpp \
 Print.cpp \
 SyslogOutput.cpp \
 Ticks.cpp \
 Time.cpp \
 TimeStamp.cpp \
 TimeZone.cpp \
 Vintage.cpp \
 ready.cpp \
 string.cpp \
 int8_Number.cpp \
 int16_Number.cpp \
 int32_Number.cpp \
 int64_Number.cpp \
 uint8_Number.cpp \
 uint16_Number.cpp \
 uint32_Number.cpp \
 uint64_Number.cpp
 
MANIFEST_ETC=\
 README.h
	
MANIFEST_O=$(addprefix $(CORELC)/, $(addsuffix .o, $(basename $(MANIFEST_CPP))))

################################################################################
# REFRESH
################################################################################

PHONY+=refresh

# I use this to refresh the Desperadito sources against the core Desperado code
# base. You will never need to do this unless you have downloaded your own
# version of Desperado and have made changes to it.

refresh:
	( \
		D=$(shell cd ../$(CORE); pwd); \
		egrep '^(MAJOR|MINOR|BUILD)[[:space:]]*=' $$D/Makefile > release.mk; \
		( for H in $(MANIFEST_H); do cp $$D/include/com/diag/$(CORELC)/$$H include/com/diag/$(CORELC)/$$H; done ); \
		( for C in $(MANIFEST_CPP); do cp $$D/$$C $(CORELC)/$$C; done ); \
		( for E in $(MANIFEST_ETC); do cp $$D/$$E $$E; done ); \
	)
	
-include release.mk

################################################################################
# BUILD
################################################################################

TARGETS+=include/com/diag/$(CORELC)
TARGETS+=$(CORELC)

TARGETS+=$(MANIFEST_O)
ARTIFACTS+=$(MANIFEST_O)
ARCHIVABLE+=$(MANIFEST_O)

################################################################################
# DIRECTORIES
################################################################################

include/com/diag/$(CORELC):
	mkdir -p $@
	
$(CORELC):
	mkdir -p $@

################################################################################
# LIBRARIES AND SHARED OBJECTS
################################################################################

TARGETS+=lib$(PROJECT).a
DELIVERABLES+=lib$(PROJECT).a

lib$(PROJECT).a:	$(ARCHIVABLE)
	$(AR) $(ARFLAGS) lib$(PROJECT).a $(ARCHIVABLE)
	$(RANLIB) lib$(PROJECT).a

TARGETS+=lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)
DELIVERABLES+=lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)

lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD):	lib$(PROJECT).a
	HERE="`pwd`"; \
	THERE="`mktemp -d $(TMP)/$(PROJECT).XXXXXXXXXX`"; \
	( cd $$THERE; $(AR) $(SOFLAGS) $$HERE/lib$(PROJECT).a ); \
	$(CC) $(CARCH) -shared -Wl,-soname,lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) -o lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) $$THERE/*.o; \
	rm -rf $$THERE

TARGETS+=lib$(PROJECT).so.$(MAJOR).$(MINOR)
DELIVERABLES+=lib$(PROJECT).so.$(MAJOR).$(MINOR)

lib$(PROJECT).so.$(MAJOR).$(MINOR):	lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD)
	ln -s -f lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) lib$(PROJECT).so.$(MAJOR).$(MINOR)

TARGETS+=lib$(PROJECT).so.$(MAJOR)
DELIVERABLES+=lib$(PROJECT).so.$(MAJOR)

lib$(PROJECT).so.$(MAJOR):	lib$(PROJECT).so.$(MAJOR).$(MINOR)
	ln -s -f lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) lib$(PROJECT).so.$(MAJOR)

TARGETS+=lib$(PROJECT).so
DELIVERABLES+=lib$(PROJECT).so

lib$(PROJECT).so:	lib$(PROJECT).so.$(MAJOR)
	ln -s -f lib$(PROJECT).so.$(MAJOR).$(MINOR).$(BUILD) lib$(PROJECT).so

################################################################################
# PATTERNS
################################################################################

%.txt:	%.cpp
	$(CXX) -E $(CPPFLAGS) -c $< > $*.txt

%.o:	%.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c $<

%.txt:	%.c
	$(CC) -E $(CPPFLAGS) -c $< > $*.txt

%.o:	%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<

%:	%_unstripped
	$(STRIP) -o $@ $<

################################################################################
# DEPENDENCIES
################################################################################

PHONY+=depend

ARTIFACTS+=dependencies.mk

depend:
	DEPENDS="`find . -type f \( -name '*.c' -o -name '*.cpp' \) -print`"; \
	echo "DEPENDS=\"$$DEPENDS\""; \
	$(CXX) $(CPPFLAGS) -M -MG $$DEPENDS > dependencies.mk

-include dependencies.mk

################################################################################
# DISTRIBUTION
################################################################################

PHONY+=dist

ARTIFACTS+=$(PROJECT)-$(MAJOR).$(MINOR).$(BUILD).tgz

dist $(PROJECT)-$(MAJOR).$(MINOR).$(BUILD).tgz:
	TARDIR=$(shell mktemp -d /tmp/$(PROJECT).XXXXXXXXXX); \
	svn export $(SVN_URL) $$TARDIR/$(PROJECT)-$(MAJOR).$(MINOR).$(BUILD); \
	tar -C $$TARDIR -cvzf - $(PROJECT)-$(MAJOR).$(MINOR).$(BUILD) > $(PROJECT)-$(MAJOR).$(MINOR).$(BUILD).tgz; \
	rm -rf $$TARDIR

################################################################################
# ENTRY POINTS
################################################################################

PHONY+=all clean clobber pristine

all:	$(TARGETS)

clean:
	rm -f $(ARTIFACTS)
	
clobber:	clean
	rm -f $(DELIVERABLES)

################################################################################
# END
################################################################################

.PHONY:	$(PHONY)
