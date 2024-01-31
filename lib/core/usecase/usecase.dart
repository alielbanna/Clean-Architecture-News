
// Type and Params are called generic types
abstract class UseCase<Type,Params> {
  Future<Type> call({Params params});
}