# TOOLS NEEDED

LaTex
 - TexLive	Tex compiler software (has support for Xindy)
 - pdflatex	Compile into pdf files
 - xindy	Index compilation
 - biber	Bibliography registers


On windows you'll need some sort of bash terminal too (GIT bash is fine)

### 2021,
For low quality images I found a browser version of the xbr smooth 
scaling algorithm, worked wonders. I used [this one](https://www.maxlaumeister.com/pixel-art-upscaler/)
Also, I used the app Camscanner to get a perfect white background on
drawn images. Worked perfectly.

# WINDOWS

Install TexLive (full or atleast with xindy)

https://www.tug.org/texlive/

The zip-file contains bat files for running the installation from command
line. The executable may have the problems described in the
troubleshooting part of https://www.tug.org/texlive/windows.html, but it
should be possible to follow the instructions to fix them.

 There is a known issue with the texindy.pl and xindy.pl script files
using incorrect paths on windows. I do not know of the correct fix, but
it can be temporarily worked around by adding the absolute installation
path of xindy/modules directory to the $cmd_dir variable in the Perl
scripts.

After a while of trying to get xindy to work on windows I have
concluded that it is highly recommended to use linux for this project.

# LINUX

Install the TexLive and xindy applications.

```
apt-get install texlive-full
apt-get install xindy
```

or short:
`apt-get install texlive-full xindy`

--------------------------------------------------------------------------
You need to have a 'tex/inputenc/utf8.xdy' file with 'utf-8 encoding'
inside the xindy installation.


This file should exist by default on Windows installations, but on Linux
you might have to create it by yourself.

This is easiest done by copying the 'tex/inputenc/latin.xdy' to a temp
directory where you have write rights. Then executing the command to
change from latin1 (iso-8859-1) to utf-8 encoding:

`iconv -f iso-8859-1 -t utf-8 latin.xdy > utf8.xdy`
	
And copying the newly created file 'utf8.xdy' to 'tex/inputenc/utf8.xdy'


# EMERALD FONT (Handwritten fonts)

Emerald font needs to be installed to be able to compile the project. At
least on Windows this font is not installed by default in the TexLive
distribution.

Follow these instructions to get it working on your LaTex distribution.

https://www.tug.org/fonts/fontinstall.html

Unzip the files found in root/emerald_font_package and read the README
provided with the files.

### 2021 update, Windows 10, TeXLive
I noticed the intructions in the README are outdated. You should first 
copy the tex and fonts folders to texmf-local (if using TeXLive), then 
edit or create texmf-local/web2c/updmap.cfg with the line 
Map emerald.map

Then run `mktexlsr`,

then run `updmap-sys`.

# Printable version, 2021

In order to send the book to be printed, you need to compile `sangbok.tex`, ideally using `clean_build.sh` (but if that doesn't work I found a workaround, likely only necessary on Windows, found in the folder _compilation workaround 2021_). Then you need to compile `sangbok_print_wrapper.tex`, which takes `sangbok.pdf` and places it into a larger page format, which has (when pages are A6) a 15mm empty border on all sides. This is necessary for the printing process. After you have the file `sangbok_print_wrapper.pdf`, you need to use some software (I used Acrobat, note: not Acrobat _reader_, but the full software) to add trim markings 4mm from the edges. Pdf should be in format PDFX1a, for correct color interpretation. More instructional images can be found in the folder _Instructions for printing_. Hardcover design sent to printer is the file `cover_withoutbleed.pdf` in the folder _Hardcover design 2021_, which also contains the inkscape file and source vector graphics files, in case the design needs to be re-done.

The specifications of the order can be found in _Instructions for printing_.

### Cover design

In 2021 I used Inkscape to create the book's cover design.

I also made an additional TeX file called sangbok_print_wrapper,
which works as a "frame" into which sangbok.pdf is placed. The wrapper
is sized 130mm x 178mm (A6 plus 15mm on each side), with 15mm margins
on all sides. This way sangbok.pdf can be designed how it should look
when printed, and then placed into the correctly sized frame onto 
which trim marks are then added (using ex. Acrobat) with a 15mm border.
