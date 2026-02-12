parse_fasta <- function(file_name) {
  lines <- readLines(file_name) # read all lines from the file
  
  sequences <- list() # empty list to store the results
  current_id <- NULL # store the sequence header
  current_sequence <- "" # store the sequence letters
  
  for (line in lines) {
    # if line starts with ">" it will be a new sequence
    if (startsWith(line, ">")) {
      # if we are currently building a sequence save it
      if (!is.null(current_id)) {
        sequences[[current_id]] <- current_sequence
      }
      # store id
      current_id <- substring(line, 2)
      current_sequence <- ""
      
    } else {
      current_sequence <- paste0(current_sequence, line) # add sequence letters
    }
  }

  if (!is.null(current_id)) {
    sequences[[current_id]] <- current_sequence # save the last sequence
  }
  
  return(sequences)
}

# test

fasta_data <- parse_fasta("query_sequences.fasta")
length(fasta_data)
names(fasta_data)
