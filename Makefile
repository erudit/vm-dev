all:
	packer build packer.json
	vagrant up
packer:
	packer build packer.json
vagrant:
	vagrant up

clean:
	vagrant destroy -f
	rm -f *.box
