import gleam/list

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0b00 -> Ok(Adenine)
    0b01 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  list.fold(over: dna, from: <<>>, with: fn(acc, x) {
    <<acc:bits, encode_nucleotide(x):2>>
  })
}

fn decode_dna(
  dna: BitArray,
  acc: List(Nucleotide),
) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<value:2, rest:bits>> -> {
      case decode_nucleotide(value) {
        Ok(nucleotide) -> decode_dna(rest, list.append(acc, [nucleotide]))
        Error(_) -> Error(Nil)
      }
    }
    <<>> -> Ok(acc)
    _ -> Error(Nil)
  }
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  decode_dna(dna, [])
}
