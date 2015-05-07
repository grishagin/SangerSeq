######################################
#script to perform analyses of multiple *.ab1 files
#asks for folders with:
#code dependencies, *.ab1 files, and *.txt files with theoretical sequences
#returns 
#(1) chromatograms
#(2) sequences
#(3) experimental sequences aligned with theoretical ones

main.code.folder<-"D:\\_\\Templates_and_Scripts\\R\\SangerSeq\\dependencies\\"
######################################

#source all functions for auxiliary files
dir.R<-choose.dir(default = main.code.folder,caption = "Choose directory with dependent R scripts (functions).")
files.R<-list.files(dir.R,full.names = TRUE,pattern=".R")
sapply(files.R,FUN=source)

#get the list of *.ab1 files
dir.ab1<-choose.dir(default = getwd(),
                caption = "Choose directory with *.ab1 files.")
files.ab1<-list.files(dir.ab1,full.names = TRUE,pattern=".ab1")

outdir<-paste0(dir.ab1,"\\output")
dir.create(outdir,showWarnings = FALSE)
#write chromatograms and DNA sequences
sapply(files.ab1,FUN=function(seqFileName){chroma(seqFileName=seqFileName, 
                                                  outdir=outdir)})

#perform pairwise alignment
#ask for directory with files containing expected/theoretical sequences
dir.theor<-choose.dir(default = outdir,
                      caption = "Choose directory with expected sequences as *.txt files.")
files.theor<-list.files(dir.theor,full.names = TRUE,pattern=".txt")
files.exp<-list.files(outdir,full.names = TRUE,pattern=".txt")
if (length(files.theor)!=length(files.exp)) {
        stop("There is a different number of files with theoretical and experimental sequences!")
}
#call alignment function - 
#- will write alignment patterns to file in output directory
sapply(1:length(files.exp),FUN=function(counter) {
        pairAlignDNA(file.theor<-files.theor[counter],
                     file.exp<-files.exp[counter])
        })


