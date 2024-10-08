# plant_MutS_expansion
Data and code for the analysis of the expanded MutS gene family in plants

Results are described in the following preprint:
- Sloan DB, Broz AK, Kuster SA, Muthye V, Peñafiel-Ayala A, Marron JR, Lavrov DV, Brieba LG. 2024. [Expansion of the MutS gene family in plants](https://www.biorxiv.org/content/10.1101/2024.07.17.603841v1). bioRxiv. 2024.07.17.603841v1.



Folders are organized by figure in the above manuscript. Each contains fasta alignments (trimmed and untrimmed) and newick-formatted tree files for phylogenetic analyses. R code an input files are also provided for ggtree plots with domain architecture and targeting data.

The general workflow for all phylogenetic analyses used MAFFT (L-INS-i) v7.520 , trimAl v1.4.rev22 build[2015-05-21], and IQ-TREE v2.3.0 (Mar 14 2024 build) as follows.

`linsi FILE.fas > FILE.aligned.fas`

`trimal -in FILE.aligned.fas -out FILE.trim.fas -htmlout FILE.trim.html -gt 0.8`

`iqtree -s FILE.trim.fas -b 1000 -nt 6`
