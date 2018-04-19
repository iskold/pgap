cwlVersion: v1.0
label: "taxonomy_check_16S"
class: Workflow # task type
hints:
  DockerRequirement:
    dockerPull: ncbi/taxonomy_check_16S:pgap4.5
inputs:
  blastdb: string
  blastdb_dir: Directory
  asn_cache: Directory
  align: File
outputs:
  report:
    type: File
    outputSource: taxonomy_check_16S/report
steps:
  taxonomy_check_16S:
    run: ../progs/taxonomy_check_16S.cwl
    in:
      blastdb: blastdb
      blastdb_dir: blastdb_dir
      asn_cache: asn_cache
      ifmt: 
        default: seq-align
      input: align
      top:
        default: 10
    out: [report]
        