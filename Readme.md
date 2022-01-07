# Setup Steps

- If using docker see [Docker](#docker)

- If python virtual environment is already created for your local docs directory see [Usage](#usage) steps else start with [Installation](#installation).

- Checkout the docs directory and execute the below commands.

## Docker

```console
> docker build . -t sphinx:latest
> docker run --rm -it -h sphinx -v $(pwd):/mnt/host/docs -w /mnt/host/docs -p 8000:8000 sphinx
> sphinx-autobuild ./source/ ./build/html/ --port 8000 --host 0.0.0.0
```

## Installation

```console
> python3 -m venv venv
> source venv/bin/activate
> pip3 install -r requirements.txt
```

## Usage

```console
> source venv/bin/activate
> make html -b spelling -b linkcheck
> sphinx-autobuild ./source/ ./build/html/ --port 8000 --host 0.0.0.0
```

From now any updates to files will be reflected on local host in real time. Open the url - http://127.0.0.1:8000 in your browser.

---
**NOTE**

If there are any false positives in spellings, they can be added to [Spelling](./source/spelling_wordlist.txt) file.

---

## Additional Commands

> Clean build folder, inside venv run : `make clean`

> Exit/Deactivate virtual environment run : `deactivate`.
