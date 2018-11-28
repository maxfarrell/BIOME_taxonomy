import os

def merge_seqs(output):
    pass


def process_midori(input_path,
                   output_path,
                   keep_species = True,
                   latin_binomial = None):
    copy_input(input_path, output_path)
    merge_seqs(output_path)
    if assign_taxonomy:
        process_taxa(output_path, latin_binomial)
    else:
        pass


def merge_seqs(fpath):
    cmd = r"""cat {fpath} | awk '/^>/ {{printf("\n%s\n",$0);next; }} {{ printf("%s",$0);}}  END {{printf("\n");}}' > test3.fasta
    """.format(fpath=fpath)
    print(cmd)
    os.system(cmd)

def copy_input(input_path, output_path):
    cmd = "cp {} {}".format(input_path, output_path)
    os.system(cmd)

output_path = "/Users/krissankaran/Desktop/test_output.fasta"
merge_seqs(output_path)
