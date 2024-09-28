function handler(event) {
  var request = event.request;
  let replace_strings = [
    "/games/weordl",
    "/games/ladder",
    "/games/digits",
    "/games/bemuse",
  ]

  // do any path modifications for other origins
  for (let i = 0; i < replace_strings.length; ++i) {
    request.uri = request.uri.replace(replace_strings[i] + "/", "/");
  }

  for (let i = 0; i < replace_strings.length; ++i) {
    request.uri = request.uri.replace(replace_strings[i], "/");
  }

  // Check whether the URI is missing a file name.
  if (request.uri.endsWith('/')) {
    request.uri += 'index.html';
  }
  // Check whether the URI is missing a file extension.
  else if (!request.uri.includes('.')) {
    request.uri += '/index.html';
  }

  return request;
}