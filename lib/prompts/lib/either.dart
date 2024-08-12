sealed class Either<L,R>{}

final class Left<L,R> extends Either<L, R>{
  L left;
  Left(this.left);
}

final class Right<L,R> extends Either<L,R> {
  R right;
  Right(this.right);
}