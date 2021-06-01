# <p align='center'> 不同服务器之间的文件同步 </p>

1. 从远程服务器同步到本地
```bash
sshpass -p passwd rsync -r -e "ssh -p 22" user@1.1.1.1:/your/dir /local/dir
```

2. 从本地同步到远程服务器
```bash
sshpass -p passwd rsync -r -e "ssh -p 22" /local/dir user@1.1.1.1:/your/dir 
```
