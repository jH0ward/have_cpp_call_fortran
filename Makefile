CXX = /opt/apps/intel15_3/openmpi/1.8.5/bin/mpic++
LDFLAGS = -shared-intel -shared-intel -L/home/jchoward/newriver/dl_mg_1.8.4
CXXFLAGS = -DRESTRICT=__restrict__ -Xlinker -export-dynamic -fPIC -std=c++11 -qopenmp      -g -O0 -debug -DDEBUG -Wall -Wuninitialized -Wno-unknown-pragmas -ansi
CXXSRC = $(notdir $(wildcard *.cc))
INCLUDES = -I/home/jchoward/src/psi4/nr_objdir/interfaces/include -I/home/jchoward/src/psi4/nr_objdir/src/lib -I/home/jchoward/src/psi4/src/lib -I/home/jchoward/src/psi4/include -I/home/jchoward/src/psi4/nr_objdir/include -I/home/jchoward/src/psi4/nr_objdir/boost/include -I/opt/apps/intel15_3/python/2.7.10/include/python2.7 -I/usr/include -I/usr/include -I/opt/apps/intel/15.3/compiler/include -I/usr/include -I/opt/apps/intel15_3/openmpi/1.8.5/include
CXXDEFS = -DHAVE_GDMA -DHAVE_DKH -DHAVE_MM_MALLOC_H -DHAVE_MPI -DHAVE_MKL_LAPACK -DHAVE_MKL_BLAS -DHAS_CXX11_VARIADIC_TEMPLATES -DHAS_CXX11_STATIC_ASSERT -DHAS_CXX11_SIZEOF_MEMBER -DHAS_CXX11_RVALUE_REFERENCES -DHAS_CXX11_NULLPTR -DHAS_CXX11_LONG_LONG -DHAS_CXX11_LAMBDA -DHAS_CXX11_INITIALIZER_LIST -DHAS_CXX11_DECLTYPE -DHAS_CXX11_CSTDINT_H -DHAS_CXX11_CONSTEXPR -DHAS_CXX11_AUTO_RET_TYPE -DHAS_CXX11_AUTO -DHAS_CXX11_FUNC -DHAS_CXX11 -DSYS_LINUX -DUSE_FCMANGLE_H

PSITARGET = program

# Start the compilation rules
default:: $(PSITARGET)

# Add the flags needed for shared library creation
ifeq ($(UNAME), Linux)
    LDFLAGS += -shared
endif
ifeq ($(UNAME), Darwin)
    LDFLAGS += -shared -undefined dynamic_lookup
    CXXFLAGS += -fno-common
endif

# The object files
#BINOBJ = $(CXXSRC:%.cc=%.o)

DEPENDS = effside.o
#%.o: %.cc
#	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $<
%.o: %.cc
	$(CXX) -c $<

BINOBJ = $(CXXSRC:%.cc=%.o)

$(PSITARGET): $(BINOBJ)
	$(CXX) -lifcore -o $@ $^ libeff.a
clean:
	rm -f seaside.o program
