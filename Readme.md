# Working with Docs

- See [Docker](#docker) steps if you're using **Docker container**. See [Virtual Environment](#virtual-environment) if you're using **Python venv**.

- Checkout this repo and execute the below commands.

## Docker

```console
> docker build . -t sphinx:latest
> docker run --rm -it -h sphinx -v $(pwd):/mnt/host/docs -w /mnt/host/docs -p 8000:8000 sphinx
```

You can now begin on documentation and following the [build steps](#build-steps) guide.

---

## Virtual Environment

If python virtual environment is **not** created for your local docs directory start with [Installation](#installation) steps for Ubuntu, else you can activate the virtual environment using [Activation and Deactivation](#activation-and-deactivation) steps.

### Installation

- The below steps require Python3.8 to be installed. To install using APT manager use the below command.

```console
> sudo apt install python3.8
```

- After verifying Python3.8 execute the below commands to create the virtual environment.

```console
> python3 -m venv venv
> source venv/bin/activate
> pip3 install -r requirements.txt
```

### Activation and Deactivation

To activate the virtual environment created in your repo follow the below step. **Ignore** if already activated.

```console
> source venv/bin/activate

> # Exit/Deactivate the entered virtual environment run 
> deactivate
```

Once venv is activated you can begin on documentation and following the [build steps](#build-steps) guide.

## Build Steps
```console
> # To clean the generated html files, inside venv run
> make clean

> # To generate html pages and warn for spellings and broken links
> make html -b spelling -b linkcheck
```

---
**NOTE**

If there are any **false positives** in spellings, they can be added to [Spelling](./source/spelling_wordlist.txt) file.

---

### Live Preview

```console
> # To generate html pages from rst files and present them in the browser as we make changes use
> sphinx-autobuild ./source/ ./build/html/ --port 8000 --host 0.0.0.0
```

From now any updates to files will be reflected on local host in real time. Open the url - http://127.0.0.1:8000 in your browser.
