#' Plot a gfpop graph as a matrix of nodes and edges
#'
#' @param graph A gfpop graph object created using gfpop::graph()
#' @param node_size Size of the nodes in the plot (default: 30)
#' @param arrow_size Size of the arrow heads (default: 0.5)
#' @param label_dist Distance of labels from nodes (default: 0.5)
#' @param edge_label_size Size of edge labels (default: 0.7)
#' @param title Plot title (default: "Graph visualization")
#'
#' @return An igraph plot object
#' @export
#'
#' @examples
#' \dontrun{
#' library(gfpop)
#' g <- graph(
#'   Edge("normal", "normal", type="null", rule=1),
#'   Edge("normal", "normal", type="std", rule=1, penalty=5.5),
#'   Edge("normal", "normal", type="null", rule=2),
#'   Edge("noChange", "noChange", type="null", rule=2))
#' plotModel(g)
#' }
plotModel <- function(graph, node_size = 30, arrow_size = 0.5, 
                      label_dist = 0.5, edge_label_size = 0.7,
                      title = "Graph visualization") {
  
  # Check if igraph is installed
  if (!requireNamespace("igraph", quietly = TRUE)) {
    stop("Package 'igraph' is needed for this function to work. Please install it.",
         call. = FALSE)
  }
  
  # Extract edges from the graph
  edges <- graph$edges
  
  # Extract unique states and rules
  states <- unique(c(edges$state1, edges$state2))
  rules <- unique(edges$rule)
  
  # Sort states and rules for consistent display
  states <- sort(states)
  rules <- sort(rules)
  
  # Create a data frame mapping states and rules to indices
  n_states <- length(states)
  n_rules <- length(rules)
  
  state_indices <- data.frame(
    state = states,
    row = seq_along(states)
  )
  
  rule_indices <- data.frame(
    rule = rules,
    col = seq_along(rules)
  )
  
  # Create a igraph object
  g <- igraph::make_empty_graph(directed = TRUE)
  
  # Add vertices (nodes)
  vertex_labels <- character(n_states * n_rules)
  vertex_x <- numeric(n_states * n_rules)
  vertex_y <- numeric(n_states * n_rules)
  
  for (i in 1:n_states) {
    for (j in 1:n_rules) {
      idx <- (i - 1) * n_rules + j
      vertex_labels[idx] <- paste(states[i], "\nRule", rules[j])
      vertex_x[idx] <- j  # column position (rule)
      vertex_y[idx] <- n_states - i + 1  # row position (state), inverted for top-to-bottom display
    }
  }
  
  g <- igraph::add_vertices(g, n = n_states * n_rules, 
                           name = paste(rep(states, each = n_rules), 
                                        rep(rules, times = n_states), sep = "_"),
                           label = vertex_labels,
                           x = vertex_x,
                           y = vertex_y)
  
  # Add edges
  edge_list <- list()
  edge_labels <- list()
  
  for (i in 1:nrow(edges)) {
    edge <- edges[i, ]
    
    # Get the indices of the states
    s1_row <- state_indices$row[state_indices$state == edge$state1]
    s2_row <- state_indices$row[state_indices$state == edge$state2]
    
    # Get the column index for the rule
    rule_col <- rule_indices$col[rule_indices$rule == edge$rule]
    
    # Calculate vertex indices
    v1_idx <- (s1_row - 1) * n_rules + rule_col
    v2_idx <- (s2_row - 1) * n_rules + rule_col
    
    # Add the edge if both vertices exist
    if (length(v1_idx) > 0 && length(v2_idx) > 0) {
      edge_list[[length(edge_list) + 1]] <- c(v1_idx, v2_idx)
      
      # Create edge label
      label <- edge$type
      if (!is.null(edge$penalty) && !is.na(edge$penalty) && edge$penalty > 0) {
        label <- paste0(label, "\n(", edge$penalty, ")")
      }
      edge_labels[[length(edge_labels) + 1]] <- label
    }
  }
  
  # Convert lists to vectors/matrices
  if (length(edge_list) > 0) {
    edge_matrix <- do.call(rbind, edge_list)
    g <- igraph::add_edges(g, as.vector(t(edge_matrix)), label = unlist(edge_labels))
  }
  
  # Plot the graph
  layout_matrix <- cbind(vertex_x, vertex_y)
  
  plot <- igraph::plot.igraph(
    g,
    layout = layout_matrix,
    vertex.size = node_size,
    vertex.color = "lightblue",
    vertex.frame.color = "darkblue",
    vertex.label.dist = label_dist,
    vertex.label.color = "black",
    edge.arrow.size = arrow_size,
    edge.label.cex = edge_label_size,
    edge.label.color = "red",
    edge.curved = 0.3,
    main = title
  )
  
  return(invisible(g))
}
