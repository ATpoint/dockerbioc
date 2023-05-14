# README

![CI](https://github.com/ATpoint/dockerBioc/actions/workflows/actions.yml/badge.svg)
![BiocVersion](https://img.shields.io/badge/Bioconductor%20version-3.17-000000?labelColor=87b13f&logo=r)
   
Use this `Dockerfile` to build a custom image based on `bioconductor/bioconductor_docker:RELEASE_X_Y` with:

- several boilerplate packages installed (`pak, renv, RhpcBLASctl, rmdformats, bookdown, markdown, rmarkdown, remotes, devtools`)
- personalized defaults towards RStudio appearance, Rmarkdown and save/load settings (always clean environment, no autosaves)
- an `renv` lockfile documenting all package versions after the build process in `/r_user_lib/lockfile_initial.json`
- set `/projectdir` as default path inside RStudio
- use `RhpcBLASctl` to disable implicit BLAS/OMP multithreading

Build:

```bash
docker build -t user/name:version .
```

Currently, the latest version at Github is `atpoint/dockerbioc:3.17-0`.

Launch RStudio-Server: 

```bash
docker run -d -p 8787:8787 -e PASSWORD=aPassword -e ROOT=TRUE -v /path/to/data:/projectdir user/name:version
```

Type `localhost:8787` into your browser to access the session.
