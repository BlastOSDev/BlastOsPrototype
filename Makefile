
GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-bulitin -fno-rtti -fno-expections -fno-leading-underscar
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
                
