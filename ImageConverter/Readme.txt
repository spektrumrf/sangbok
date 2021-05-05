You can convert any of the following file formats:

png
jpeg
jpg
tif
tiff
bmp


You just have to specify a folder with the images in it (then all images inside will get converted) or single files.


java -jar ImageConverter [dir]

java -jar ImageConverter [file1]

java -jar ImageConverter [file1] [file2] [file3]




There are a couple of optional arguments (they have to be in this order to work properly...)

-d	Defines the output directory (you can specify it with a relative path as well)
-o	Defines the output format (select from the list of supported file formats above)


java -jar ImageConverter -d [output dir] [input args]

java -jar ImageConverter -o [output format] [input args]

java -jar ImageConverter -d [output dir] -o [output format] [input args]
