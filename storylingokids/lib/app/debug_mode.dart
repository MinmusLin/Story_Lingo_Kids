/*
 * Project Name:  StoryLingoKids
 * File Name:     debug_mode.dart
 * File Function: 调试模式类
 * Author:        林继申
 * Update Date:   2024-06-11
 * License:       MIT License
 */

class DebugMode {
  static bool isDebugMode = true;

  static void toggleDebugMode() {
    isDebugMode = !isDebugMode;
  }
}
