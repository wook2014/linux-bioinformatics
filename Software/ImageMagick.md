# ImageMagick 常见操作

## 批量转换文件夹中图片的格式
```bash
for file in *.png
    do convert $file ${file%%.*}.jpg
done
```


