import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatelessWidget {
  static const LatLng homeLatLng = LatLng(
      35.86250205132113, // 위도
      127.1279423647522 // 경도
      );

  // 집 위치 마커 선언
  static const Marker marker =
      Marker(markerId: MarkerId('home'), position: homeLatLng);

  static Circle circle = Circle(
    circleId: const CircleId('choolCheckCircle'),
    center: homeLatLng, // 원 중심이 되는 위치
    fillColor: Colors.blue.withOpacity(0.5), // 원 색상
    radius: 500, // 원 반지름
    strokeColor: Colors.blue, // 원 테두리 색
    strokeWidth: 1, // 원 테두리 두께
  );

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 지도 위치 지정
      appBar: renderAppBar(),
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: ((context, snapshot) {
          // 로딩 상태
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // 권한 허가된 상태
          if (snapshot.data == '위치 권한이 허가되었습니다.') {
            // 기존 Column 위젯 관련 코드
            return Column(
              children: [
                Expanded(
                  // 2/3 공간 차지
                  flex: 2,
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: homeLatLng,
                      zoom: 15, // 확대 정도 (높을수록 크게 보인다)
                    ),
                    myLocationEnabled: true, // 내 위치 지도에 보여주기
                    markers: {marker}, // Set으로 Marker 제공
                    circles: {circle}, // Set으로 Circle 제공
                  ),
                ),
                Expanded(
                  // 1/3 공간 차지
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        // 시계 아이콘
                        Icons.timelapse_outlined,
                        color: Colors.blue,
                        size: 50.0,
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () async {
                          final curPosition =
                              await Geolocator.getCurrentPosition(); // 현재 위치

                          final distance = Geolocator.distanceBetween(
                            curPosition.latitude, // 현재 위치 위도
                            curPosition.longitude, // 현재 위치 경도
                            homeLatLng.latitude, // 집 위치 위도
                            homeLatLng.longitude, // 집 위치 경도
                          );

                          bool canCheck = distance < 100; // 100미터 이내에 있으면 출근 가능

                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text('출근하기'),

                                // 출근 가능 여부에 따라 다른 메시지 제공
                                content: Text(
                                  canCheck ? '출근을 하시겠습니까?' : '출근할 수 없는 위치입니다',
                                ),
                                actions: [
                                  TextButton(
                                    // 취소를 누르면 false 반환
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('취소'),
                                  ),
                                  if (canCheck) // 출근 가능한 상태일 때만 [출근하기] 버튼 제공
                                    TextButton(
                                      // 출근하기를 누르면 true 반환
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      child: const Text('출근하기'),
                                    ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('출근하기!'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          // 권한 없는 상태
          return Center(
            child: Text(
              snapshot.data.toString(),
            ),
          );
        }),
      ),
    );
  }

  AppBar renderAppBar() {
    // AppBar를 구현하는 함수
    return AppBar(
      centerTitle: true,
      title: const Text(
        '오늘도 출첵',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Future<String> checkPermission() async {
    final isLocationEnabled =
        await Geolocator.isLocationServiceEnabled(); // 위치 서비스 활성화 여부 확인

    if (!isLocationEnabled) {
      // 위치 서비스 활성화 안됨
      return '위치 서비스를 활성화해주세요.';
    }

    LocationPermission checkedPermission =
        await Geolocator.checkPermission(); //  위치 권한 확인

    // 위치 권한 거절됨
    if (checkedPermission == LocationPermission.denied) {
      // 위치 권한 요청하기
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }

    // 위치 권한 거절됨 (앱에서 재요청 불가)
    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정헤서 허가해주세요';
    }

    // 위 모든 조건이 통과되면 위치 권한 허가 완료
    return '위치 권한이 허가되었습니다.';
  }
}
