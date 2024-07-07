library(ggplot2)
library(viridis)
library(ggtree)
library(ggnewscale)


tree = ggtree::read.tree(file = "MutS1.trim.fas.treefile")

gene_data1 = read.delim("curated_domains1.txt")
gene_data2 = read.delim("curated_domains2.txt")
gene_data3 = read.csv("targetP.csv")

p1 = ggplot(tree, aes(x,y)) + geom_tree() + geom_tiplab(size=2.5) + geom_text2(aes(label=label, subset = !is.na(as.numeric(label)) & as.numeric(label) > 50), size=2, nudge_x = -0.4, nudge_y = 0.4) + hexpand(0.15) + theme_tree()
p2 = flip(p1,19,24) %>% flip(27,33) %>% flip(14,15) %>% flip(28,30) %>% flip(8,9)
p3 = facet_plot(p2, panel = "Domains", data = gene_data1, geom = geom_segment, mapping = aes(x=0, xend=Seq_Length, y=y, yend=y), size=0.5, color='black')
p4 = facet_plot(p3, panel = "Domains", data = gene_data1, geom=geom_segment, aes(x=Start, xend=End, y=y, yend=y, col=Domain), size=3) + theme(legend.position = "bottom") + scale_color_viridis(discrete = TRUE)
p5 = facet_plot(p4, panel = "Domains", data = gene_data2, geom=geom_segment, aes(x=Start, xend=End, y=y, yend=y, col=Domain), size=3, color='firebrick3') + theme(legend.position = "bottom")
p6 = facet_plot(p5, panel = "Organelle Targeting", data = gene_data3, geom=geom_col, aes(x=10*Targeting, fill=Organelle), orientation = 'y') + theme(legend.position = "bottom") + new_scale_color() + scale_fill_brewer(palette = 'Dark2')
p6