# pimatic-bbb-docker

![license](https://img.shields.io/github/license/sesceu/pimatic-bbb-docker.svg "license")
![stars](https://img.shields.io/docker/stars/sesceu/pimatic-bbb-docker.svg "stars")
![pulls](https://img.shields.io/docker/pulls/sesceu/pimatic-bbb-docker.svg "pulls")
![imagesize](https://img.shields.io/imagelayers/image-size/sesceu/pimatic-bbb-docker/dev.svg "imagesize")

A docker build context for the [pimatic](http://pimatic.org) home automation software to be deployed on a Beaglebone Black. We're using the cross build toolchain from [resin.io](https://resin.io) which can be found [here](https://github.com/resin-io-projects/armv7hf-debian-qemu).

**Discontinued:** At first start, pimatic loads and compiles a lot of stuff, which unfortunately would happen on every `docker run`. I tried patching the start script, but was unsuccessful, probably since I'm not too familiar with node.js yet. I'll try my luck with [home-assistant.io](https://github.com/sesceu/homeassistant-bbb-docker) now, since I'm much more a pythonist than I'll probably ever become a node.js-onist.
