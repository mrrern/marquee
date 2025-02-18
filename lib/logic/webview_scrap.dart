// import "dart:async";
// import 'package:http/http.dart' as http;
// import 'package:html/dom.dart' as dom;

// Future<void> fetchOpiniones() async {
//   final url = Uri.parse(
//       'https://www.bodas.net/musica/marquee-audiovisuales--e63528/opiniones');

//   // Agregar los encabezados proporcionados en la solicitud
//   final headers = {
//     "accept":
//         "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
//     "accept-language": "es-ES,es;q=0.9",
//     "cache-control": "max-age=0",
//     "priority": "u=0, i",
//     "sec-ch-ua":
//         "\"Not(A:Brand\";v=\"99\", \"Google Chrome\";v=\"133\", \"Chromium\";v=\"133\"",
//     "sec-ch-ua-mobile": "?0",
//     "sec-ch-ua-platform": "\"Linux\"",
//     "sec-fetch-dest": "document",
//     "sec-fetch-mode": "navigate",
//     "sec-fetch-site": "none",
//     "sec-fetch-user": "?1",
//     "upgrade-insecure-requests": "1"
//   };

//   final response = await http.get(url, headers: headers);
//   dom.Document html = dom.Document.html(response.body);

//   final titles = html
//       .querySelectorAll("div.storefrontReviewsTileContent > p")
//       .map((element) => element.innerHtml.trim())
//       .toList();

//   print("cuenta menol : ${titles.length}");
//   for (final title in titles) {
//     print(title);
//   }
// }
