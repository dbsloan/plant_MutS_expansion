library(ggplot2)
library(viridis)
library(ggtree)

tree = ggtree::read.tree(file = "MutS_genes_for_cdd.nwk")

gene_data1 = read.delim("domains1.txt")
gene_data2 = read.delim("domains2.txt")

p1 = ggplot(tree, aes(x,y)) + geom_tree() + geom_tiplab(size=2.5) + hexpand(1.5) + theme_tree()
p2 = facet_plot(p1, panel = "Domains", data = gene_data1, geom = geom_segment, mapping = aes(x=0, xend=Seq_Length, y=y, yend=y), size=0.5, color='black')
p3 = facet_plot(p2, panel = "Domains", data = gene_data1, geom=geom_segment, aes(x=Start, xend=End, y=y, yend=y, col=Domain), size=3) + theme(legend.position = "bottom") + scale_color_viridis(discrete = TRUE)
p4 = facet_plot(p3, panel = "Domains", data = gene_data2, geom=geom_segment, aes(x=Start, xend=End, y=y, yend=y, col=Domain), size=3, color='firebrick3') + theme(legend.position = "bottom")

p4