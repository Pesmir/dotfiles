# Installation
Run this code in the `~/.config` folder to clone this repo
```
git init
git remote add origin git@github.com:Pesmir/.config.git
git fetch
git reset origin/main
git checkout -t origin/main
```
# Pyright example config
```
{
	"venv": "<envname>",
	"venvPath": "."
}
```

# Vimspector example config
```
{
    "configurations": {
        "CurrentFile":{
            "adapter": "debugpy",
            "configuration": {
                "name": "Standard",
                "type": "python",
                "request": "launch",
                "python.pythonPath": "<relative env path>",
                "program": "${file}"
            }
        }
    }
}
```


