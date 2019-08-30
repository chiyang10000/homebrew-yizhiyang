# Homebrew yizhiyang collection

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap chiyang10000/homebrew-yizhiyang
brew search chiyang10000
```

## OushuDB

```bash
# `brew reinstall` intend for daily upgrade
brew reinstall oushudb
source /usr/local/opt/oushudb/greenplum_path.sh
# Edit /usr/local/opt/oushudb/etc/hawq-site.xml to setup configurations.
```

## PlanChecker

```bash
brew reinstall planchecker

cd `brew --prefix planchecker` # It is important to change the working directory
nohup bash -c 'PORT=38324 planchecker' > /tmp/planchecker.log &
open http://localhost:38324

# Follow the website's Usage instrunction
# to parse your Greenplum/Apache HAWQ/OushuDB plan
```

