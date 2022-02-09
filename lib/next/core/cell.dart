class CellData {
  CellData({
    required this.foreground,
    required this.background,
    required this.flags,
    required this.content,
  });

  int foreground;

  int background;

  int flags;

  int content;
}

abstract class CellAttr {
  static const bold = 1 << 0;
  static const faint = 1 << 1;
  static const italic = 1 << 2;
  static const underline = 1 << 3;
  static const blink = 1 << 4;
  static const inverse = 1 << 5;
  static const invisible = 1 << 6;
  static const strikethrough = 1 << 7;
}

abstract class CellColor {
  static const shift = 25;
  static const mask = 3 << shift;

  static const normal = 0 << shift;
  static const named = 1 << shift;
  static const palette = 2 << shift;
  static const rgb = 3 << shift;
}

abstract class CellContent {
  static const codepointMask = 0x1fffff;

  static const widthShift = 22;

  static const widthMask = 3 << widthShift;
}