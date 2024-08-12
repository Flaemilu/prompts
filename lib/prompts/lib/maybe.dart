sealed class Maybe<A> {}

final class Nothing<A> extends Maybe<A>{}
final class Just<A> extends Maybe<A> {
  A a;
  Just(this.a);
}
