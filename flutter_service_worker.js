'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5acc39759c874fd637bb722cd266777f",
"assets/AssetManifest.json": "fb83bea72d3af8656b64afc381f37b9e",
"assets/assets/images/ctasection.png": "d2308d3d8298133d5894a5ffc01409e0",
"assets/assets/images/ctasection2.png": "ccbc7df12e0f4a86a0929ba3415f6ccc",
"assets/assets/images/desktop_software_development.png": "b5a1435a77d49a34a168f0f54004eee7",
"assets/assets/images/figma_logo.png": "4352919f1cbe9c59a4e605df1e577a33",
"assets/assets/images/firebase_logo.png": "75d065998371d467fb822b69a1075462",
"assets/assets/images/flutter_logo.png": "52ffed09d6b0737d8e0cf0b077f7776d",
"assets/assets/images/goprologo.png": "e6f53097608b4527b429119c4cddfdf7",
"assets/assets/images/GoProWeb.png": "6d05b509db763fb7a3534a0efbcf8c47",
"assets/assets/images/GPAndroid.png": "5edb8c6061d5e70f82f440aca63867fc",
"assets/assets/images/Logo.jpg": "3af18432de24dda8675d9e6f9b858464",
"assets/assets/images/mobile_app_development.png": "21157ba6d6e3c89cb98d0c2ea13e546b",
"assets/assets/images/ourprocess.jpg": "aa2cd28c8b06f29d8ba2e66405e0ae4c",
"assets/assets/images/reallonglawlogo.png": "710a356f71094594cce104ac3dbb29f6",
"assets/assets/images/RLLWeb1.png": "63aacbf0e4322a738d8910334464d259",
"assets/assets/images/RLLWeb2.png": "78cf395ef946ec76d3b273f61ae093c8",
"assets/assets/images/RLLWeb3.png": "4fb636c367ada9490af33c2bda8d3987",
"assets/assets/images/RLLWeb4.png": "62f387d0e21a3fcda60a80c66f45a52d",
"assets/assets/images/TT_Android.png": "272129e45e44f9ccf00fbbf93735e753",
"assets/assets/images/TT_iOS.png": "57d7003ac2e9ec7dcbeecfdf691fc92b",
"assets/assets/images/tytanlogo.png": "f25bedb8d695d052b0a31da675cd5aec",
"assets/assets/images/tytanweb.png": "87845620237397232328e3c95cd2fd71",
"assets/assets/images/tytanweb2.png": "32d2b86332d7cf33b7b1643807a5af7f",
"assets/assets/images/website_development.png": "80304aed6381ae7e15067367e90bc64d",
"assets/FontManifest.json": "c6b115e9ab2ac9308748c8767ca04429",
"assets/fonts/MaterialIcons-Regular.otf": "06e6b751a4e5b1942f2acc63932cd777",
"assets/NOTICES": "3e87814bbf38c12abce9f255b3ff5d0a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/social_media_buttons/fonts/SocialMediaIcons.ttf": "be271838cfb555093a41e12292acce83",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "dd5b7e38ac853fcf41faa69cf49aa175",
"canvaskit/canvaskit.wasm": "9c898609617c74603b8dfb06063bc7ce",
"canvaskit/chromium/canvaskit.js": "36d162e8f857ceeacbf01ed75a382f56",
"canvaskit/chromium/canvaskit.wasm": "6fd6d23da7cbe9ba4096ad57bcc89b82",
"canvaskit/skwasm.js": "5256dd3e40ec9fe1fc9faa51a116bcfd",
"canvaskit/skwasm.wasm": "d6add23d7e35f0cf4cc537ec8f1b0e08",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "a96e4cac3d2da39d86bf871613180e7b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "73dacd3f29226a0ad02b6cbd7a128614",
"/": "73dacd3f29226a0ad02b6cbd7a128614",
"main.dart.js": "d4f3e7dfd685eaedc79dc83e4b7b768a",
"manifest.json": "7c7c2ed1394d48ec3da4fdf8922f400a",
"version.json": "a60617b957a73a6263abbc2a2b20c10d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
