
GPPPARAMS = -m32
ASPARAMS = --32
LDPARAMS = -melf_i386

objects = loader.o kernel.o

%.o: %.cpp
       g++ $(GPPPARAMS) -o $@ S<
       
%.o: %.s
         as $(ASPARAMS) -o $@ S<
         
mykernel.bin: linker.ld $(objects)
        ld $(LDPARAMS)
        
        install: mykernel.bin
                sudo cp S< /boot/mykernel.bin
                
