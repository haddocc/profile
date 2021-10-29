# profile
Custom profile functions neatly ordered

Also comes with a crontab which updates automatically.

## Instructions
add 
```
for f in ~/profiles/*; do source $f; done
```
to your ~/.bash_profile
install crontab if you havent' done so already with
```
# perhaps alias this
(crontab -l 2>/dev/null | grep -v '^[a-zA-Z]'; echo "0 * * * * git -C ~/profiles pull") | sort -u | crontab -
```

## Todo
- envs for configuring crontab behaviour
- do adding to ~/.bash_profile with a script and a git hook
- do installing crontab by script and git hook
