part of 'stv_line_chart.dart';

class _STVDashedLine extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Alignment textAlign;
  final Color strokeColor;
  final double height;
  final int dashWidth;
  final int dashCount;

  const _STVDashedLine({
    super.key,
    required this.text,
    required this.strokeColor,
    required this.height,
    required this.dashWidth,
    required this.dashCount,
    required this.textStyle,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, height * 8),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashHeight = height;
          final dCount = (boxWidth / (dashCount * dashWidth)).floor();
          return Stack(
            alignment: Alignment.centerRight,
            children: [
              Flex(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: Axis.horizontal,
                children: List.generate(dCount, (_) {
                  return Row(
                    children: [
                      SizedBox(
                        width: dashWidth.toDouble(),
                        height: dashHeight,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: strokeColor),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              Text(
                text,
                style: textStyle,
              ),
            ],
          );
        },
      ),
    );
  }
}
