

merge_seqs <- function(output)


process_midori <- function(input_path,
                           output_path,
                           keep_species = TRUE,
                           latin_binomial = NULL) {
  copy_input(input_path, output_path)
  merge_seqs(output_path)
  if (assign_taxonomy) {
    process_taxa(output_path, latin_binomial)
  } else {

  }
}

merge_seqs <- function(fpath) {

  cmd <- paste0(
    fpath,
    ' | awk "',
    '/^>/ {printf("\n%s\n",$0);next; }',
    '{ printf("%s",$0);}  END {printf("\n");}"')

  cmd <- paste0(
    fpath,
    " | awk \'/^>/ {printf("\n%s\n\",$0);next; } { printf(\"%s\",$0);}  END {printf(\"\n\");}'"
  )
    system(cmd)
}

copy_input <- function(input_path, output_path) {
  cmd <- sprintf("cp %s %s", input_path, output_path)
  system(cmd)
}
  