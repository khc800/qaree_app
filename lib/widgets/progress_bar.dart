import 'package:flutter/material.dart';

import '../constants/constants.dart';

// class ProgressBar extends StatelessWidget {
//   // The current progress value, must be between 0.0 and 1.0
//   final double progress;
//   // Constructor requires a progress value
//   const ProgressBar({Key? key, required this.progress}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // The progress bar
//         Container(
//           height: 20.0, // Height of the progress bar
//           clipBehavior: Clip.antiAlias, // Adds clipping to the container
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0), // Rounded corners for the progress bar
//             color: Colors.grey.shade300, // Background color of the progress bar
//           ),
//           child: LinearProgressIndicator(
//             value: progress,
//             backgroundColor: ColorsConst.grey, // Removes the default background
//             color: ColorsConst.primaryPurple, // Color of the progress indicator
//             minHeight: 20.0, // Matches the container height to fill it
//           ),
//         ),
//         // The percentage text
//         Center(
//           child: Text(
//             '${(progress * 100).toStringAsFixed(0)}%', // Converts progress to a percentage
//             style: TextStyle(
//               color: Colors.black, // Text color
//               fontWeight: FontWeight.bold, // Bold text
//               fontFamily: "Almarai", // Arabic font
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  // The current progress value, must be between 0.0 and 1.0
  final double progress;
  // Constructor requires a progress value
  const ProgressBar({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;
        final double progressWidth = maxWidth * progress;

        return Stack(
          children: [
            // The progress bar background
            Container(
              height: 20.0, // Height of the progress bar
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners for the progress bar
                color: Colors.grey.shade400, // Background color of the progress bar
              ),
            ),
            // The progress indicator
            Container(
              height: 20.0,
              width: progressWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color:  ColorsConst.primaryPurple, // Color of the progress indicator
              ),
            ),
            // The percentage text
            Positioned(
              left: progressWidth - 35, // Position the text based on the progress
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0), // Add some padding around the text
                color: Colors.transparent, // Background color of the text (optional)
                child: Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: Colors.black, // Text color
                    fontWeight: FontWeight.bold, // Bold text
                    fontFamily: "Almarai", // Arabic font
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
