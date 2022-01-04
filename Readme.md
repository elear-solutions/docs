# Building

``` console
> python3 -m venv venv
> source venv/bin/activate
> pip3 install -r requirements.txt
> make html -b spelling -b linkcheck
> make clean
> deactivate
```

## Enabling auto reload

```console
> sphinx-autobuild ./source/ ./build/html/ --port 8000 --host 0.0.0.0
```
