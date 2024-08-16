sealed class TempSettingState {
  const TempSettingState();
}

//TempSettingSttate클래스는 온도 단위 설정 상태를 나타내는 추상적인 클래스로, 이 클래스를 상속받은 두가지 상태
//Celsius, Fahrenheit가 있다.
final class Celsius extends TempSettingState {
  const Celsius();

  @override
  String toString() => 'Celsius()';
}

final class Fahrenheit extends TempSettingState {
  const Fahrenheit();

  @override
  String toString() => 'Fahrenheit()';
}
