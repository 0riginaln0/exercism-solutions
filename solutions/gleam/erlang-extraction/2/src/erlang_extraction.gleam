pub type GbTree(key, value)

@external(erlang, "gb_trees", "empty")
pub fn new_gb_tree() -> GbTree(k, v)

@external(erlang, "gb_trees", "insert")
fn insert_in_gb_tree(
  key key: k,
  value value: v,
  tree tree: GbTree(k, v),
) -> GbTree(k, v)

pub fn insert(tree: GbTree(k, v), key: k, value: v) -> GbTree(k, v) {
  insert_in_gb_tree(key: key, value: value, tree: tree)
}

@external(erlang, "gb_trees", "delete_any")
fn delete_from_gb_tree(key key: k, tree tree: GbTree(k, v)) -> GbTree(k, v)

pub fn delete(tree: GbTree(k, v), key: k) -> GbTree(k, v) {
  delete_from_gb_tree(key: key, tree: tree)
}
