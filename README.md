# Bash scripts

## ex21
**Input:**<br/>
- Path to the folder (or the name of a folder in the current location, it can be assumed that it exists and does not contain spaces
in her name)
- File type (for example txt, c) - different text file formats can be assumed
- Some word (presumably not empty)

**Output:**<br/>
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


## ex22
**Input:**<br/>
- Path to the folder (or the name of a folder in the current location, it can be assumed that it exists and does not contain spaces in the name)
- File type (for example: c, txt) - different text file formats can be assumed
- some word (presumably not empty)
- A non-negative integer

**Output:**<br/>The script goes through the received folder, and then through all its subfolders (up to the last level in the tree), reads the files of the received type, and prints to the screen the lines that contain this word and their length is greater than or equal to the number received (the length of a line will be defined as the number of words it contains).
<br/>
If the word does not appear in the file at all, the program doesn't print anything.
<br/>
For example, suppose the localDirectory folder exists and contains the following files:
<br/>
image.png
<br/>
script.sh
<br/>
text.txt<br/>
And the content of file.txt file is
<br/>
This is a text file <br/>
It contains many words <br/>
This is an example for a simple text file <br/>
For running ./ex12.sh localDirectory txt text 7 the output will be: <br/>
This is an example for a simple text file
<br/>

## ex23
**Input:**<br/>
The script accept one argument: host/ system.
In addition, the script can accept these flags:
1. name
2. version
3. pretty_name
4. home_url
5. support_url
6. static_hostname
7. icon_name
8. machine_id
9. boot_id
10. virtualization
11. kernel
12. architecture

The first five will only work if the system input is received, and the rest only if the host input is received.<br/>

**Output:**<br/>
The matching information according to the input (host/ system and the flags).<br/>
Exception: If the name flag is received with the host input, printing the symbol's name line will be treated as matching output.<br/>
If the script runs without a flag, all the information in the requested file will be printed. Otherwise, only the requested information will be printed
in flags. <br/>
The combination of several flags together is also supported.<br/>
