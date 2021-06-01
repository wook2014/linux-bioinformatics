# <p align='center'> 不同服务器之间的文件同步 </p>

1. 从远程服务器同步到本地
```bash
sshpass -p passwd rsync -r -e "ssh -p 2105" xum@159.226.126.176:/data/home/xum/methylation_cD
```
