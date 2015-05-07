#############################################################
#function that fetches all .ab1 files in current folder
#and makes *.pdf files with chromatograms

require(sangerseqR)
#############################################################

chroma<-function(seqFileName,
                 outdir=getwd()){
        #read the *.ab1 file into sangerseqR class
        ab1SEQ<-readsangerseq(filename = seqFileName)
        #get just the file name (no dir)
        seqFileName.base<-basename(seqFileName)
        
        #compose file names for output files: chromatogram + sequence
        chromaFileName<-file.path(outdir,
                                  paste0(unlist(strsplit(seqFileName.base,"[.]"))[1],".pdf"))
        
        outFileName<-file.path(outdir,
                               paste0(unlist(strsplit(seqFileName.base,"[.]"))[1],".txt"))
        
        #write chromatogram to a file
        chromatogram(ab1SEQ, trim5 = 0, trim3 = 0,
                     showcalls = c("primary", "secondary", "both", "none"), width = 100,
                     height = 2, cex.mtext = 1, cex.base = 1, ylim = 3, filename = chromaFileName,
                     showtrim = FALSE, showhets = TRUE)
        #sequence to write
        seqToWrite<-primarySeq(obj = ab1SEQ,string=TRUE)
        #create file, open for writing
        fileCon<-file(outFileName,"wb")
        
        #write sequence to a file
        writeChar(object = seqToWrite,
                  con = fileCon,
                  nchar=nchar(seqToWrite),
                  eos=NULL)
        close(fileCon)
        
}
