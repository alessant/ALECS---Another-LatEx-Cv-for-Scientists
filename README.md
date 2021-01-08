# ALECS - Another LatEx Cv for Scientists

Hey mate! Wandering around looking for a catchy and easy-to-read cv template? Bored to prepare the same, usual, sad academic cv? Your are in the right place then! 

Based on [Friggeri-CV](https://www.latextemplates.com/template/friggeri-resume-cv) and inspired by [TwentySeconds-CV](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex), this template was specifically designed to provide an off-the-shelf curriculum vitae allowing you to emphasize two critical points: i) publications and ii) technical skills. 

![sample résumé](https://github.com/alessant/ALECS---Another-LatEx-Cv-for-Scientists/raw/main/alecs.jpg)


# Build 
ALECS cv is compiled with XeLaTex, while the bibliography is handled with Biber.

## Build ALECS through GNU Make command
Build your project.

	make all

Clean your project.
	
	make clean

Clean your project bibliography.
	
	make cleanbib

Clean all outputs.
	
	make cleanall
    

## Build ALECS by hand
Use your favorite LaTex editor, but do not forget to
1. Compile with XeLaTex;
2. Build the bibliography with Biber (this command will generate all bib associated files with the data that will be included in your cv only in the third step); 
3. Compile again.


## Build requirements:

* LaTex installation.

* Additional packages:	 	
  - array
  - ifmtarg
  - ifthen
  - etoolbox
  - textpos
  - titlesec
  - tikz
  - xcolor
  - parskip
  - fontspec
  - fontawesome
  - marvosym
  - lastpage
  - everypage
  - geometry
  - hyperref
  - biblatex
