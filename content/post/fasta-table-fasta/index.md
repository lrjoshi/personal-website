+++
title = "Fasta to Table to Fasta Conversion in R"

date = 2019-08-11T00:00:00
lastmod = 2019-08-11T00:00:00
draft = false

tags = ["R","Fasta","Tabular"]
summary = "Conversion of Fasta format to Tabular format and vice versa"

[header]
image = "headers/fasta.JPG"
caption = " "


[[gallery_item]]
album = "1"
image = ""
caption = ""
+++


Sometimes we need to convert genetic sequences present in tabular format into plain text file (fasta) format. Also, often we need to convert fasta format into tabular format. DNA seqences present in tabular format can be used as a vector in R and we can do various operations like extracting part of DNA for each sequence. So, I have written two functions that would perform these tasks.



These functions can be pulled into R Studio directly from the github.


```{r}
library (devtools)
library (tidyverse)
source_url("https://raw.githubusercontent.com/lrjoshi/FastaTabular/master/fasta_and_tabular.R")
```


### Fasta to tabular format 

Suppose we have our DNA sequences in `dna_fasta.fasta` file. 


Convert this fasta file to table using following function. The output will be stored as `dna_table.csv` in the current directory. 

``` {r}
FastaToTabular("dna_fasta.fasta")

```

### Tabular to Fasta format

To convert `csv` to `fasta` format, one restriction is that **you should have your sequence names in the first column and sequence itself in the second column.** Then use following function. This will store the output table as `dna_table.fasta` file in the current working directoty. **Remember, pre-existing file with the same name will be overwritten.**


```{r}

TabularToFasta("gene.csv")

```
If you get permission error while writing files, try to create a new directory and set that directory as working directory.

Sample files and codes are present in my [Github](https://github.com/lrjoshi/FastaTabular) repository.

[Image credit: Unsplash](https://unsplash.com/photos/Skf7HxARcoc)