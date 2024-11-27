function jsShowLoader() {
    window.flutter_inappwebview.callHandler("showLoader");
}

function jsHideLoader() {
    window.flutter_inappwebview.callHandler("hideLoader");
}

function jsSetError() {
    window.flutter_inappwebview.callHandler("setError",JSON.stringify(messageStructure),);
}
  