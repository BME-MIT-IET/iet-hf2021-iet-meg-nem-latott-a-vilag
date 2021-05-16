var baseURL = new Url();

function urlencode(){
    let uen = document.getElementById("encode").value;
    let res = baseURL.encode(uen);
    alert(res.toString());
}

function urldecode(){
    let ude = document.getElementById("decode").value;
    let res = baseURL.decode(ude);
    alert(res.toString());
}

function constructortest(){
    let uc1 = document.getElementById("urlu").value;
    let uc2 = document.getElementById("urlnt").checked;
    baseURL = new Url(uc1, uc2);
    alert(baseURL.toString());
}

function clrquery(){
    baseURL.clearQuery();
    alert(baseURL.toString());
}

function lgtquery(){
    alert(baseURL.queryLength());
}

function imptquery(){
    alert(baseURL.isEmptyQuery());
}

function urlpaths(){
    let upt = document.getElementById("uppp").value;
    let res = baseURL.paths(upt);
    alert(res.toString());
}

function iabsquery(){
    alert(baseURL.isAbsolute());
}

function strfyquery(){
    alert(baseURL.toString());
}