+++
title = "Working with NCBI SRA files"

date = 2016-04-20T00:00:00
lastmod = 2018-01-13T00:00:00
draft = false

tags = ["NGS","SRA-Toolkit"]
summary = "How to download SRA files using SRA-Toolkit"

[header]
image = ""
caption = ""

[[gallery_item]]
album = "1"
image = ""
caption = ""


+++

Working with SRA files can be tricky sometimes. Here I have short description about how to download and process SRA files. 

NGS read files can be downloaded using sra-toolkit. First you have to download latest version of **sra-toolkit** from their website. The file should be in **tar.gz** format.

Then untar the file based on the OS you are using.

Then use the following command to put command line in path 
```
export PATH=$PATH:/home/joshil/ngs/rnaseq/sratoolkit.2.9.0-centos_linux64/bin
```
Remember to change the path. Here I have used my path  as an example (/home/joshi/ngs/rnaseq)


Then navigate to **sratoolkit.2.9.9-ubuntu/bin** folder. 
Your version might be different. Inside the bin folder you will be able to see all the executables. You can use each script as shown below

Eg.
```
./fastq-dump
./prefetch 
```

Suppose you want to download a SRA file named SRR6047337. Then simply use follwing command

```
./prefetch SRR6047337
```
This will download SRR6047337.sra files. Don't see the file ? Well, here is the trick. All the files are downloaded in **home/ncbi/public/sra** folder. This prefetch command automatically creates a ncbi folder under the home folder. 


Now, you need fastq files (may be paired or single) instead of .sra files. Use following command to convert **.sra** file to the fastq file.
```
./fastq-dump --split-3 SRR6047337 
```
It will take specified file from the $home/ncbi/public/sra folder and converts it to **SRR6047337_1.fastq** and **SRR6047337_2.fastq**.

Hope this will help you to download SRA files from NCBI. 


[Image credit: Unsplash](https://unsplash.com/photos/uDhuYPDM5EU)
