-module(rna_transcription).

-export([to_rna/1]).

%to_rna(Gene) -> Output.

to_rna("C") -> "G";
to_rna("G") -> "C";
to_rna("A") -> "U";
to_rna("T") -> "A";
to_rna([Head|Tails]) -> to_rna([Head]) ++ to_rna(Tails);
to_rna(_) -> [].

