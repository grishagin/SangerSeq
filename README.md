# SangerSeq
R code for processing *.ab1 files and comparing experimental sequences to theoretical ones.  
###Description
The script is designed to perform automated analyses of multiple *.ab1 files.  
#####Prompts for:  
1. folder with code dependencies  
2. folder with *.ab1 files to be analyzed  
3. folder with *.txt files containing theoretical sequences as ONE string.  Files need to be in exactly the same order as *.ab1 files.

#####Returns   
1. creates an "output" folder in the folder with the source files, and writes all of the output files there
2. chromatograms in *.pdf files
3. sequences in *.txt files
4. aligned sequences in *.txt files with "ALIGNED-" prefix

###Contents:
1. README.md  (this file)
2. LICENSE  (GNU GENERAL PUBLIC LICENSE)
3. _code_SangerSeq-MAIN-v1.R
4. dependencies  
    a. _code_FUNCTION#1_chroma-v1.R  
    b. _code_FUNCTION#2_pairAlignDNA-v1.R  
5. sample files

###Instructions
1. Download the repository.
2. Launch MAIN script.
3. Follow the prompts. 
