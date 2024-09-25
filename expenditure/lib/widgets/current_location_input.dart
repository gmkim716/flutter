import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationInput extends StatefulWidget {
  final TextEditingController locationController; // 위치를 전달받을 컨트롤러

  const CurrentLocationInput({super.key, required this.locationController});

  @override
  _CurrentLocationInputState createState() => _CurrentLocationInputState();
}

class _CurrentLocationInputState extends State<CurrentLocationInput> {
  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // 위치 정보를 가져옴
  }

  // 현재 위치를 가져오는 메서드
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스가 활성화되어 있는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        widget.locationController.text = '위치 서비스를 활성화해주세요.';
      });
      print('위치 서비스가 비활성화되었습니다');
      return;
    }

    // 위치 권한 요청 및 확인
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          widget.locationController.text = '위치 권한이 거부되었습니다.';
        });
        print('위치 권한이 거부되었습니다');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        widget.locationController.text = '위치 권한이 영구적으로 거부되었습니다.';
      });
      print('위치 권한이 영구적으로 거부되었습니다');
      return;
    }

    try {
      // 위치 정보를 가져온다
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // 위치 정보를 입력 필드에 기록
      setState(() {
        widget.locationController.text =
            '위도: ${position.latitude}, 경도: ${position.longitude}';
      });
      print('위치 정보 가져오기 성공:');
      print('위도: ${position.latitude}, 경도: ${position.longitude}');
    } catch (e) {
      setState(() {
        widget.locationController.text = '위치 정보를 가져오지 못했습니다.';
      });
      print('위치 정보 가져오기 실패: $e'); // 로그 출력
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.locationController,
      decoration: const InputDecoration(
        labelText: '위치',
        suffixIcon: Icon(Icons.location_on),
      ),
      readOnly: true, // 위치 정보를 수동으로 수정하지 못하도록 설정
    );
  }
}
