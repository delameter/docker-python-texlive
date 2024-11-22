# docker-python-texlive

[DockerHub](https://hub.docker.com/repository/docker/delameter/python-texlive) | [GitHub](https://github.com/delameter/docker-python-texlive)

---

Docker image for building PDF (LaTeX) documentation with Sphinx 5/6.

```
docker pull delameter/python-texlive
```

Based on [python:3.10-slim](https://hub.docker.com/_/python) and TeX Live 2022. Includes:

- `texlive-latex-recommended`
- `texlive-latex-extra`
- `texlive-fonts-recommended`
- `texlive-fonts-extra`
- `graphviz`
- `latexmk`
- `lpr`
- ...and a bit more

Note that Sphinx is not included as it usually gets installed in the next stage together with all the other python requirements.

---

## Changelog

### 1.3.0

Image: `delameter/python-texlive:1.3.0`

- Python 3.10 &rarr; 3.11
- Added [tex-gyre](https://ctan.org/pkg/tex-gyre?lang=en) package

### 1.2.0

Image: `delameter/python-texlive:3.10-2022-extra`

- Added [texlive-fonts-extra](https://packages.debian.org/sid/texlive-fonts-extra) package, which is required e.g. for [rendering Font Awesome icons](https://ctan.org/pkg/fontawesome5) in PDF Sphinx documentation.


### 1.1.0

Image: `delameter/python-texlive:3.10-2022`

- Python 3.8 &rarr; [3.10](https://hub.docker.com/layers/library/python/3.10-slim/images/sha256-7a08d7bfedcbf05d15b2bff8f0c86db6dd06bcbaa74c915d2d5585dbd5ba65b0)
- TeX Live 2020 &rarr; 2022

### 1.0.0

Image: `delameter/python-texlive:3.8-2020`

- Python 3.8
- TeX Live 2020
