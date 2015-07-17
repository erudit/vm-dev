all:
	packer build packer.json
	vagrant up
packer:
	packer build packer.json
vagrant:
	vagrant up

clean:
	vagrant destroy -f
	vagrant box remove "centos 7.0"
	rm -f *.box
