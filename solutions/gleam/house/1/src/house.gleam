import gleam/list
import gleam/string

// I know that this is kind of strings joining is inefficient

pub fn recite(start_verse start_verse: Int, end_verse end_verse: Int) -> String {
  list.range(start_verse, end_verse)
  |> list.map(get_nursery_rhyme)
  |> string.join(with: "\n")
}

fn get_nursery_rhyme(verse_number: Int) -> String {
  let rhyme = get_rhyme(verse_number)
  "This is " <> rhyme <> "that Jack built."
}

fn get_rhyme(rhyme_number: Int) -> String {
  case rhyme_number {
    1 -> "the house "
    2 -> "the malt that lay in " <> get_rhyme(rhyme_number - 1)
    3 -> "the rat that ate " <> get_rhyme(rhyme_number - 1)
    4 -> "the cat that killed " <> get_rhyme(rhyme_number - 1)
    5 -> "the dog that worried " <> get_rhyme(rhyme_number - 1)
    6 ->
      "the cow with the crumpled horn that tossed "
      <> get_rhyme(rhyme_number - 1)
    7 -> "the maiden all forlorn that milked " <> get_rhyme(rhyme_number - 1)
    8 ->
      "the man all tattered and torn that kissed "
      <> get_rhyme(rhyme_number - 1)
    9 ->
      "the priest all shaven and shorn that married "
      <> get_rhyme(rhyme_number - 1)
    10 ->
      "the rooster that crowed in the morn that woke "
      <> get_rhyme(rhyme_number - 1)
    11 -> "the farmer sowing his corn that kept " <> get_rhyme(rhyme_number - 1)
    12 ->
      "the horse and the hound and the horn that belonged to "
      <> get_rhyme(rhyme_number - 1)
    _ -> ""
  }
}
