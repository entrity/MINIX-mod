
MP='/home/markham/Documents/School/ECS 150 - Operating Systems/minix-3.1.0/floppy'
mkdir -p "$MP"
sudo mount -t vfat -o rw,uid=markham,gid=markham '/home/markham/VirtualBox VMs/MinShare/floppy.img' "$MP"
touch floppy/floppy/p