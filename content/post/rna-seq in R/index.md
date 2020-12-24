+++
title = "RNA-Seq Data Analysis in R"

date = 2018-05-20T00:00:00
lastmod = 2018-01-13T00:00:00
draft = false

tags = ["RNA-Seq","R","Senecavirus A"]
summary = "Rsubread package for RNA-Seq Data Analysis"

[header]
image = ""
caption = ""

[[gallery_item]]
album = "1"
image = ""
caption = ""


+++

RNA-Seq data analysis can be complicated. Softwares with graphical user interface like CLC Workbench, have made RNA-Seq data analysis quite easier.However, they are expensive and in most of the cases you might not be able to tweak your analysis in the exact way you want. Another important aspect of learning RNA-Seq analysis is understanding the algorithms behind the analysis.To this end, I decided to run a small simulation to understand how RNA-Seq analysis algorithms work.It is amazing how a single R package can do things like read aligning, read mapping and read counts in few lines of codes.

Install Rsubread package in R.
```
source("https://bioconductor.org/biocLite.R")
biocLite("Rsubread")

```
Load package 
```
library (Rsubread)
```

For this simulation I created a small .fasta file by pulling some of the sequences from the **Senecavirus A** genome. I created a fasta file with a few contigs each containing about 70-100 basepairs , and named each contig as read 1, read 2 and so on. And  I also pulled some sequences from the Zika virus which are names as Zika1 and Zika2. I will be aligning my reads to Senecavirus A genome. So, Zika virus reads should not be counted by Rsubread while aligning. 

Sequences extracted:

```
>read1
AAGGAAGGACTGGGCATGAGGGCCCAGTCCTTCCTTTCCCCTTCCGGGGGGTAAACCGGCTGTGTTTGCT
>read2
AGAGGCACAGAGGAGCAACATCCAACCTGCTTTTGTGGGGAACGGTGCGGCTCCAATTCCTGCGTCGCCA
>read3
AAGGTGTTAGCGCACCCAAACGGCGCATCTACCAATGCTATTGGTGTGGTCTGCGAGTTCTAGCCTACTC
>read4
GTTTCTCCCCTACTCACTCATTCACACACAAAAACTGTGTTGTAACTACAAGATTTGGCCCTCGCACGGG
>read5
ATGTGCGATAACCGCAAGATTGACTCAAGCGCGGAAAGCGCTGTAACCACATGCTGTTAGTCCCTTTATG
>readagain1
AAGGAAGGACTGGGCATGAGGGCCCAGTCCTTCCTTTCCCCTTCCGGGGGGTAAACCGGCTGTGTTTGCT
>readagain2
AGAGGCACAGAGGAGCAACATCCAACCTGCTTTTGTGGGGAACGGTGCGGCTCCAATTCCTGCGTCGCCA
>readagain3
GTTTCTCCCCTACTCACTCATTCACACACAAAAACTGTGTTGTAACTACAAGATTTGGCCCTCGCACGGG
>read12
CGGGGGGTAAACCGGCTGTGTTTGCTAGAGGCACAGAGGAGCAACATCCAACCTGCTTTTGT
>read23
CGGCTCCAATTCCTGCGTCGCCAAAGGTGTTAGCGCACCCAA
>read34
GTGTGGTCTGCGAGTTCTAGCCTACTCGTTTCTCCCCTACTCACTCATTCACACACAAAAA
>read45
CTACAAGATTTGGCCCTCGCACGGGATGTGCGATAACCGCAAGATTGACTCAAGCGCGGAAAGCGCTGTAACC
>readsvalast
TGCCGTACCGAGTCACGAGTACCTGCAGGCAAGATGGAGGGCCTTGTTCGACTGACCTGGATAGCCCAACGCGCTTCGGTGCTGCCGGCGATTCTGGGAGAACTCAGTCGGA
>readagain1
AAGGAAGGACTGGGCATGAGGGCCCAGTCCTTCCTTTCCCCTTCCGGGGGGTAAACCGGCTGTGTTTGCT
>zika1
AGTTGTTGATCTGTGTGAATCAGACTGCGACAGTTCGAGTTTGAAGCGAAAGCTAGCAACAGTATCAACA
>zika12
AAAGCTAGCAACAGTATCAACAGGTTTTATTTTGGATTTGGAAACGAGAGTTTCTGGTCATGAAAAACCCA
```

This fasta file needs to be changed into **fastq** format. There are many tools available to convert fasta file to fastq format. I used **reformat.sh** script which is a part of **bbmap**. You can find details about bbmap and reformat.sh script elsewhere. The general syntax is as follow:


```
./reformat.sh in= meta.fasta out=meta.fastq qfake=35

#meta.fasta is my input file, meta.fastq is the output file and we are assigning quality score of 34 to all the basepairs.
```

Now, lets go back to R. We have loaded our package already. First, we need to build index of our reference files. Use the same Senecavirus A whole genome file which you used to extract reads in the above example. The file can be in fasta format. Then run follwing command. 

```
#syntax
buildindex(basename="reference_index",reference=ref)

```


In my case it would be 



```
buildindex(basename= “seneca”, reference= “sva.fasta”)
```

Now, I can align reads in **meta.fastq** to the index file which I  created above.


```
align(index="seneca",readfile1=”meta.fastq”,output_file="alignResults.BAM")
```

I saw that all the reads that were in meta.fastq belonging to Senecavirus A were aligned while , all the Zika virus reads were ignored.The output will be in .BAM format.

Now the tricky part. We need a annotated file in GTF or GFF format to count the features or genes aligned. For viruses, in most of the cases you don't find well-annotated GTF or GFF files. Rsubread package allows you to create  such files in tabular format which they call it SAF format.

So, lets use follwing code to create one SAF file for this analysis.

```
ann <- data.frame(
GeneID=c("gene1","gene1","gene2","gene2"),
Chr="KX778101.1",
Start=c(100,1000,3000,5000),
End=c(500,1800,4000,5500),
Strand=c("+","+","-","-"),
stringsAsFactors=FALSE)
```

```
 ann
  GeneID        Chr Start  End Strand
1  gene1 KX778101.1   100  500      +
2  gene1 KX778101.1  1000 1800      +
3  gene2 KX778101.1  3000 4000      -
4  gene2 KX778101.1  5000 5500      -
```

Here you have to use Genebank accession number of virus genome as Chr. Beacuse .BAM file that we created by aligning to Senecavirus A genome have accession number liked to each reads. Other parameters can be changed. 

Now, final step is to count reads.

```
fc_SE <- featureCounts("alignResults.BAM",annot.ext=ann)
fc_SE
```

You can see how many features were counted on the basis of information you provided in SAF table. You will see all the sequences that we extracted from the Senecavirus A genome have been been counted while there will not be any counts for Zika virus sequences.

Hope this will help you to understand how Rsubread package works. If you have any confusion about using Rsubread package, they have very good documentation on Bioconductor. 


[Image credit: Unsplash](https://unsplash.com/photos/dBI_My696Rk)

