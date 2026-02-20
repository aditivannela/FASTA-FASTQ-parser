parse_fastq <- function(file_name) {
  lines <- readLines(file_name, n = 4000)  # read all lines from the file
  
  reads <- list()  # empty list to store reads
  
  # FASTQ files contain 4 lines per read
  for (i in seq(1, length(lines), by = 4)) {
    
    id_line <- lines[i]              # read ID line
    sequence_line <- lines[i + 1]    # sequence letters
    plus_line <- lines[i + 2]        # "+" separator line
    quality_line <- lines[i + 3]     # quality scores
    
    # remove "@" from the read ID
    read_id <- substring(id_line, 2)
    
    # store sequence and quality together
    reads[[read_id]] <- list(
      sequence = sequence_line,
      quality = quality_line
    )
  }
  
  return(reads)
}

# test
fastq_data <- parse_fastq("SRR1552455.fastq")
length(fastq_data)
names(fastq_data)