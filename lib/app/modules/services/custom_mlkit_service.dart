// // lib/services/custom_mlkit_service.dart

// import 'package:flutter/foundation.dart';
// import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

// class CustomMLKitService {
//   final String modelPath;
//   final String labelsPath;
//   late ImageLabeler imageLabeler;

//   CustomMLKitService({
//     required this.modelPath,
//     required this.labelsPath,
//   }) {
//     loadModel();
//   }

//   Future<void> loadModel() async {
//     try {
//       final options = CustomImageLabelerOptions(
//         modelPath: modelPath,
//         confidenceThreshold: 0.5,
//       );
//       imageLabeler = ImageLabeler(options: options);
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error loading model: $e');
//       }
//     }
//   }

//   Future<List<ImageLabel>> classifyImage(InputImage inputImage) async {
//     try {
//       final List<ImageLabel> labels =
//           await imageLabeler.processImage(inputImage);
//       return labels;
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error classifying image: $e');
//       }
//       rethrow;
//     }
//   }
// }
