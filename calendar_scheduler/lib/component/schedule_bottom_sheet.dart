import 'package:calendar_scheduler/component/custom_text_field.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // 키보드 높이 가져오기
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Container(
        // 화면의 반 높이에 키보드 높이 추가하기
        height: MediaQuery.of(context).size.height / 2 + bottomInset,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            // 패딩에 키보드 높이를 추가해서 위젯을 전반적으로 위로 올려주기
            left: 8,
            right: 8,
            top: 8,
            bottom: bottomInset,
          ),

          // 시간 관련 텍스트 필드와 내용 관련 텍스트 필드를 세로로 배치
          child: Column(
            // 시작 시간 종료 시간 가로로 배치
            children: [
              const Row(
                // 시작 시간 입력 필드
                children: [
                  Expanded(
                    child: CustomTextField(label: '시작 시간', isTime: true),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: CustomTextField(
                      label: '종료시간',
                      isTime: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Expanded(
                child: CustomTextField(
                  label: '내용',
                  isTime: false,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onSavedPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                  ),
                  child: const Text('저장'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSavedPressed() {}
}
