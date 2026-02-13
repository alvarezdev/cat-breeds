class Result<L, R> {
  final L? left;
  final R? right;

  Result.left(this.left) : right = null;
  Result.right(this.right) : left = null;

  bool get isLeft => left != null;
  bool get isRight => right != null;
}
