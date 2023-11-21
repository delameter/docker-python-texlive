# docker-python-texlive

[DockerHub](https://hub.docker.com/repository/docker/delameter/python-texlive) | [GitHub](https://github.com/delameter/docker-python-texlive)

Docker image for building PDF (LaTeX) documentation with Sphinx 5/6.


### Python 3.8 + TeX Live 2020 

```
docker pull delameter/python-texlive:3.8-2020
```

Based on [python:3.8-slim](https://hub.docker.com/_/python). Includes:
- texlive-latex-recommended
- texlive-fonts-recommended
- texlive-latex-extra
- latexmk
- cm-super
- graphviz
- lpr

> Note that Sphinx is not included as it usually gets installed in the next stage together with all the other python requirements.


### Python 3.10 + TeX Live 2022 

```
docker pull delameter/python-texlive:3.10-2022
```

Similar to previous one, but based on [newer image](https://hub.docker.com/layers/library/python/3.10-slim/images/sha256-7a08d7bfedcbf05d15b2bff8f0c86db6dd06bcbaa74c915d2d5585dbd5ba65b0) and with updated dependencies.


### Python 3.10 + TeX Live 2022 Extra

```
docker pull delameter/python-texlive:3.10-2022-extra
```

Extension of the previous one, the difference is the presence of [texlive-fonts-extra](https://packages.debian.org/sid/texlive-fonts-extra) package, which is required e.g. for  [rendering Font Awesome icons](https://ctan.org/pkg/fontawesome5) in PDF Sphinx documentation.
