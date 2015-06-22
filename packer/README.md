Mifos X Packer Templates
========================

Mifos X Packer Templates for different output formats:

Vagrant / VirtualBox
--------------------

To build a Vagrant box with Mifos X on Debian 7.8.0 amd64:

```
packer build debian-7.8.0-amd64-mifosx-15.03.json
```

The .box file contains a virtualbox template.

Following variables are available:
 * compression_level
 * cpus
 * disk_size
 * headless
 * memory
 * mirror

Microsoft Azure Image
---------------------

To build a MS Azure VHD image with Mifos X on Ubuntu 14 LTS amd64, you'll first need the [packer-azure](https://github.com/MSOpenTech/packer-azure) builder:

```
packer build ubuntu-serv14-mifosx-15.03.json
```

Following vars are available:

 * sn: subscription name
 * ps: path to publish settings file
 * sa: storage account name
 * sc: storage account container

