abstract class Failure {}

//if no internet
class OfflineFailure extends Failure {}

//if data error from server
class ServerFailure extends Failure {}

// user insert wrong data in auth methods login or signup
class WrongDataFailure extends Failure {}
