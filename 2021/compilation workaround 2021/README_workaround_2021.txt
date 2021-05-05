A workaround I did 2021,
since I could not get texindy to work
in the shell scripts.

I placed these files in the same directory as 
sangbok.tex, and fixed correct file paths in the
command in quickfix2

and ran clean, then quickfix1,

then I copied the line from the text file
quickfix 2 and ran it manually in CMD
(must have correct path),
finally I ran quickfix 3.

In essence, this is the exact same as running
clean_build, and that is how it should be done,
however I soent an exorbitant amount of time figuring
out why it didn't work, and then gave up.

If clean_build works for you, ignore this folder.
