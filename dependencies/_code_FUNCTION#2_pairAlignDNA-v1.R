##############################################################
#perform pairwise alighnment of two DNA sequences
require(Biostrings)
##############################################################

pairAlignDNA<-function(file.theor,
                       file.exp){
        #read in the theoretical and experimental sequences
        readChar(file.theor,file.info(file.theor)$size)
        seq.theor<-DNAString(readChar(file.theor,file.info(file.theor)$size))
        seq.exp<-DNAString(readChar(file.theor,file.info(file.exp)$size))
        
        #perform alignment
        aligned<-pairwiseAlignment(seq.theor,seq.exp)
        
        #sort out the proper output file name
        #save to directory with theoretical sequences
        out.dir<-dirname(file.exp)
        out.filename<-paste0("ALIGNED-",unlist(strsplit(basename(file.theor),"[.]"))[1],".txt")
        out.full.filename<-file.path(outdir,out.filename)
        
        #write the alignments to file
        writePairwiseAlignments(x=aligned,file = out.full.filename)
}

