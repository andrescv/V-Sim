JAVA=java
JAVAC=javac
JFLAGS=

# build classpath
CLASSPATH=.

# all src files
SRCDIR=.
SRC=$(shell find $(SRCDIR) -not -path './test/*' -name '*.java')

# all class files
OBJDIR=build
OBJS=$(patsubst $(SRCDIR)/%.java, $(OBJDIR)/%.class, $(SRC))


# VSim script
run-vsim: build Makefile $(OBJS)
	$(RM) run-vsim
	echo '#!/bin/sh' >> run-vsim
	echo 'cd build'  >> run-vsim
	echo '$(JAVA) -cp $(CLASSPATH) VSim $$*' >> run-vsim
	chmod 755 run-vsim

# create build directory
build:
	@echo "creating build directory..."
	mkdir -p build

# compile vsim
$(OBJS): $(OBJDIR)/%.class: $(SRCDIR)/%.java
	$(JAVAC) $(JFLAGS) -cp $(CLASSPATH) -d build $<

.PHONY: clean

clean:
	rm -rf build run-vsim