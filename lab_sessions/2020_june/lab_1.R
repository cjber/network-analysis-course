library(igraph)


# Group 1
```{r}
library(dplyr)
library(igraph)
edges <- read.csv('../data/congress-twitter-network-edges.csv')
nodes <- read.csv('../data/congress-twitter-network-nodes.csv')
popular <- nodes[nodes['followers_count'] > 100000,]
edges <- edges[which( edges$source %in% popular$id_str) ,]
edges <- edges[which( edges$target %in% popular$id_str) ,]
g <- graph_from_data_frame(d=edges, vertices=popular, directed=TRUE)
V(g)$color <- popular$party
plot(g)
```

# Group 2
library(igraph)
library(network)
library(tidyverse)
library(ggnetwork)

nodes <- read.csv("./data/congress-twitter-network-nodes.csv")
edges <- read.csv("./data/congress-twitter-network-edges.csv")

g <- ggnetwork(
    graph_from_data_frame(d = edges, vertices = nodes, directed = TRUE)
)
isolated <- which(degree(g) == 0)
g2 <- delete.vertices(g, isolated)

g <- g[g$y < 0.3, ]

ggplot(fortify(g), aes(x, y,
    xend = xend, yend = yend
)) +
    geom_edges(alpha = 0.2) +
    geom_nodes(aes(colour = party, size = followers_count)) +
    theme_blank()

# Group 3


# Group 4
