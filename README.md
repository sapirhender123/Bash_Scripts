# Bash scripts

## ex21
The script accepts the following arguments:
- Path to the folder (or the name of a folder in the current location, it can be assumed that it exists and does not contain spaces
in her name)
- File type (for example txt, c) - different text file formats can be assumed
- Some word (presumably not empty)

The script goes through the received folder, reads the files of the received type, and prints to the screen the lines that contain this word. If the word does not appear at all in any of the files, there is no
print.
<br/>
For example, suppose the folder localDirectory exists and the following files:
- image.png
- script.sh
- text.txt
<br/>
and the content of the text.txt file is
This is a text file
<br/>
It contains many words
<br/>
This is an example for a simple text file
<br/>
For running ./ex21.sh localDirectory txt text the output will be:
<br/>
This is a text file
<br/>
This is an example for a simple text file

