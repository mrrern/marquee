'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"canvaskit/skwasm_heavy.js": "f5c1413d222bc68856296fc97ac9fec0",
"canvaskit/canvaskit.wasm": "5070b29729807b44a517ff8ecdb9e31c",
"canvaskit/skwasm_heavy.js.symbols": "4c6915a46a80eab1f5d7d6d435c117ad",
"canvaskit/chromium/canvaskit.wasm": "49702d666184f2ea01f8ed6f3cbc2111",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "56b8de673e91c6624dc16cd0f1f9a838",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm.js.symbols": "021707ff64ac37e2c81850adca34e06f",
"canvaskit/skwasm.wasm": "f821008e63e8b0223476af8e7b5e7df7",
"canvaskit/canvaskit.js.symbols": "867d15540d09106a65fd18e4e83408b3",
"canvaskit/skwasm_heavy.wasm": "1e8e650beee57cf019dc8aef15f587c4",
"canvaskit/skwasm.js": "37fdb662bbaa915adeee8461576d69d7",
"assets/packages/flutter_inappwebview_web/assets/web/web_support.js": "509ae636cfdd93e49b5a6eaf0f06d79f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/AssetManifest.bin": "5780f9afd8724a4b302a05215449eb61",
"assets/fonts/MaterialIcons-Regular.otf": "6134f3ce1cbc4ebc13b84019ef022d0c",
"assets/AssetManifest.json": "7bff45623e1baf1c0d70875fa753c7ac",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/assets/logo.png": "e1d6f0ff86a4dbb3a5c4b1cc5bf9a95c",
"assets/assets/video/1.mp4": "3090b5d507936ca2a2a6f1ea09955eca",
"assets/assets/background.svg": "442a1309c7e158215f807b06a1148a5f",
"assets/assets/images/bod1.png": "b1e7b61710efbc8596fcfb28ca595c09",
"assets/assets/images/inst.svg": "2fa21f6fce030076be9d89dd85496a56",
"assets/assets/images/f10.png": "a65c02e95b708a4be4c54f2348d1717c",
"assets/assets/images/iconSpain.png": "73c2ec82625126b6a7c44c514a202c61",
"assets/assets/images/img2.png": "637d4c635ed164fecbc8848dc62cf355",
"assets/assets/images/Perlin2.png": "c7240e0346143a55de16ebc5b3f5d96d",
"assets/assets/images/f4.png": "0393b046807b91c666b30bfea0b7e842",
"assets/assets/images/f5.png": "9454b2b8620523cc14ef87cac4d3b222",
"assets/assets/images/f11.png": "71b567acddb1d425e3920dc94787e17e",
"assets/assets/images/f1.png": "48b233805e6fd779e355e83132dce363",
"assets/assets/images/bod3.png": "9cdc01c2019fcd5e655dfa47119cae4c",
"assets/assets/images/f8.png": "f715cf4ac5d8c498c24fcf40d2edb11a",
"assets/assets/images/face.svg": "a6a36fca4b5a389d0eefbbd3a9c53a7e",
"assets/assets/images/Group%252047.png": "727826bc9a1aaa1ff3cd8cb0b3cf0268",
"assets/assets/images/img1.png": "a55dc1dc5ccf0d57c3d5b94bf65e13f1",
"assets/assets/images/f2.png": "1654296a8248935040db34f06cd1460a",
"assets/assets/images/f3.png": "fa727aa88d9548522181b63c8bccf95a",
"assets/assets/images/f12.png": "06e71316e00870dd471b2f073eeca147",
"assets/assets/images/bck.png": "ebf396dc9ef3f59d8b6fd53c44b9a11c",
"assets/assets/images/f6.png": "b573372aa222fb2450ef05604adbc718",
"assets/assets/images/frame1.png": "9cc79c11b314f26fabecf7f58ffceefe",
"assets/assets/images/pizarra.png": "16c40dbbf7b798b8788d4a4424fa08b0",
"assets/assets/images/tiktok.svg": "dd51865a1718e9fa210e5797267401e6",
"assets/assets/images/frame2.png": "ae37cee7aadd85450cd7e3d4ea9814df",
"assets/assets/images/f9.png": "fe3a38a56b9013798daca88000a8bddb",
"assets/assets/images/spotify.png": "b3faa9d2c18abc61b510b6d7b76adb4e",
"assets/assets/images/bod2.png": "c6f39b4fb0b3d8f243c90747275eb4bf",
"assets/assets/images/img3.png": "e6c301efa3ee503c0093a4da25e19752",
"assets/assets/images/Port2.png": "a1a44d4a5b98dad5f04107e7e3ac0dcd",
"assets/assets/images/youtube.png": "71d4ee29ed8362c3c4c03424e4ce3391",
"assets/assets/images/Port1.png": "bfec838d57083dc1bae052f9eb3c65aa",
"assets/assets/images/f7.png": "9792e7bc77d4976e73485d5dba883120",
"assets/assets/images/bod4.png": "2c9bb3cf34e06f6fe8335070b2bfc597",
"assets/assets/sponsors/marquee-audiovisuales-logotipo-panasonic.jpg": "ce11b628c9f3532a049e7cbe65cbd097",
"assets/assets/sponsors/marquee-audiovisuales-logotipo-christie.jpg": "fd182f496045be9bc1bf05c4b50639fa",
"assets/assets/sponsors/marquee-audiovisuales-logotipo-briteq.jpg": "51970990f743ca0d61c4272d7f23412f",
"assets/assets/sponsors/marquee-audiovisuales-logotipo-dbtechnologies.jpg": "08b39830fd51c1160b6fc966f970edc4",
"assets/assets/sponsors/marquee-audiovisuales-logotipo-twaudio.jpg": "89f4b1cf6262cafd00fd8adaa91b43e9",
"assets/assets/sponsors/spons.png": "f2db96f2791d47ac82f12638c15e66c0",
"assets/assets/sponsors/marquee-audiovisuales-logotipo-bose.jpg": "954009f5859c3fa76edbd62860de8827",
"assets/assets/sponsors/marquee-audiovisuales-logotipo-sennheiser.jpg": "e8fe66c821d37301b57c904dd58f6656",
"assets/assets/sponsors/marquee-audiovisuales-logotipo-pioneerdj.jpg": "5edd9753d69fa1c8bb31abbe40421f9b",
"assets/assets/sponsors/marquee-audiovisuales-logotipo-model1.jpg": "525b7680ac3f02f630dc8f8d01aec467",
"assets/NOTICES": "9f49c8f61781e8590b7549aef2464686",
"assets/AssetManifest.bin.json": "788fc94ae0b9a70cbebf07853e39f98b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"flutter.js": "baab3b6ad5e74e3f0d43d96274f5fba9",
"manifest.json": "bbd7d79d0f713cf03bcb04c504a9b856",
"index.html": "6f7a50b513d60e8c0d2caaf9465806a8",
"/": "6f7a50b513d60e8c0d2caaf9465806a8",
"version.json": "0ce703cc3a36bb0f5ff7bea5d12adcf9",
"flutter_bootstrap.js": "4ae704c64724f49c9159e46392e009ff",
"main.dart.js": "741d28a1994ce73736e5a3469e9cc457",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
