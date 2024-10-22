# bamtol_market_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Note

## 10장. 첫 페이지 진입 처리

### shared_preferences 라이브러리

- 앱이 실행된 적이 있는지 확인해서 첫 소개 페이지로 갈지, 메인 페이지로 갈지 결정하려면 상태를 저장해야 합니다
- 이때의 상태를 앱 내의 변수로 저장한다면, 앱을 종료하고 다시 실행할 때 변수가 사라지기 때문에 원하는 기능을 구현할 수 없습니다
- 앱이 종료되어도 사라지지 않는 곳에 데이터를 저장하기 위해 라이브러리를 사용합니다
- `$ flutter pub acc shared_preferences`

## 11장. 스플레시 페이지

### 목적

앱이 실행될 때 필요한 정보를 불러오거나, 서버 데이터와 로컬 데이터의 싱크를 맞추는 상황에서 사용
