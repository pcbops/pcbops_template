# pcbops_template

Note, Project is migrating to pcbops group, which will bring improvements and enable the disabled outputs like erc/drc, additionally travis integration

Simple Template for Automating PCB Design Project

Supported EDAs:
  - kicad 5.x

Supported Build Systems:
  - Gitlab-ci

Supported Functions:
  - Plot Schematics
  - Plot Gerbers

Disabled Functions:
  - 

## Use

### Template

Copy the Project template and create a new pcb project in the kicad directory

Modify the makefile targets to your project name and pcb files

Load the project on gitlab or wait for the travis support

### In situ

Point your build system to use the `pcbops/cicd-docker` image, the scripts and Makefile will be copied therein

Copy `.gitlab-ci.insitu.yml` to your project to have the default set of build targets

Refer to the documentation of the build image for how to configure the docker environment for your project





## Dependencies

### Environment

- Kicad
- `pcbnew` python package
- build scripts
- `eeshow` (optional)

Environment is provided through a docker image `akshmakov/pcb-cicd` , https://github.com/akshmakov/pcb-cicd-docker

This docker package is based on the excelent kicad-docker image from Jan Szuimec. [jszuimec/kicad-docker](https://github.com/jszuimec/kicad-docker)

Currently it is based on the [fork of the image](https://github.com/akshmakov/kicad-docker/tree/v5-builder)  to reorganize slightly for this ci_cd template. All the build scripts are provided therein

Additionally. eeshow Hacked support is provided by the extension image [akshmakov/eeshow](https://github.com/akshmakov/eeshow/tree/develop/v5-libraries). In order to reduce image size this is copied using docker multi stage build  by the pcb-cicd image.





