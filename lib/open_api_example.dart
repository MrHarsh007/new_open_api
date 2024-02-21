// Openapi Generator last run: : 2024-02-21T17:57:53.336436
import 'package:openapi_generator/openapi_generator.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties:
        AdditionalProperties(pubName: 'petstore_api', pubAuthor: 'Johnny dep'),
    inputSpec:
        RemoteSpec(path: 'https://petstore3.swagger.io/api/v3/openapi.json'),
    generatorName: Generator.dio,
    outputDirectory: 'api/petstore_api')
class OpenapiGeneratorConfig {}



  // void loadData() async {
  //   try {
  //     final petResponse = await widget.petApi.getPetById(petId: 9);
  //     if (petResponse.data != null) {
  //       print(petResponse);
  //     } else {
  //       print("Error");
  //     }
  //     // print("data: ${petResponse.data}");
  //     // print("extra: ${petResponse.extra}");
  //     // print("headers: ${petResponse.headers}");
  //     // print("isRedirect: ${petResponse.isRedirect}");
  //     // print("realUri: ${petResponse.realUri}");
  //     // print("redirects: ${petResponse.redirects}");
  //     // print("requestOptions: ${petResponse.requestOptions}");
  //     // print("statusMessage: ${petResponse.statusMessage}");
  //     // print("statusCode: ${petResponse.statusCode}");
  //   } catch (e) {
  //     print("Network error: $e"); // Handle network errors
  //   }
  // }

