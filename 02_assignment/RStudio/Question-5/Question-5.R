library("tidyverse")
library("visNetwork")
library("igraph")

map_nodes <- nodes
map_edges <- edges

map_edges <- map_edges %>%
  mutate(width = total/5)

visNetwork(map_nodes, map_edges, width = "100%") %>% 
  visEdges(arrows = "middle") %>%
  visEdges(color = "blue") %>%
  visIgraphLayout(layout = "layout.star")
  visLegend()

# visOptions(highlightNearest=list(enabled = T,degree =2,hover=T))

# map_nodes <- map_nodes  %>% 
# mutate(color = plyr::mapvalues(county, ("DUBLIN"), ("red")))
# mutate(from = plyr::mapvalues(send.location, from = map_nodes$location, to = map_nodes$id),
# to = plyr::mapvalues(receive.
# visIgraphLayout(layout = "layout_on_grid")
# visIgraphLayout(layout = "layout_on_sphere")

# visNetwork(nodes = map_nodes,edges = map_edges,width = "100%") %>% 
# visLegend()