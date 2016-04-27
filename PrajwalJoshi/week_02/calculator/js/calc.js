var squarebtn = document.getElementById('square-button');

var square =function(event){
    var squareinput = parseInt(document.getElementById('square-input').value);
    var square = squareinput * squareinput;
    document.getElementById('solution').innerHTML = square;
}

squarebtn =addEventListener('click',square);



var halfbtn = document.getElementById('half-button');

var doHalf =function(event){
    var inpt = parseInt(document.getElementById('half-input').value);
    var half = inpt/2;
    console.log("half "+inpt);
    document.getElementById('solution').innerHTML = half;
}

halfbtn =addEventListener('click',doHalf);

var percentbtn = document.getElementById('percent-button');

var doPercent =function(event){
    var inpt1 = parseInt(document.getElementById('percent1-input').value);
    var inpt2= parseInt(document.getElementById('percent2-input').value);
    var percent = (inpt1/inpt2* 100).toFixed(2);
    document.getElementById('solution').innerHTML = percent;
}

percentbtn =addEventListener('click',doPercent);

var areabtn = document.getElementById('area-button');

var areaOfCrc =function(event){
    var radius = parseInt(document.getElementById('area-input').value);
    var area = (Math.PI * radius * radius).toFixed(2);
    document.getElementById('solution').innerHTML = area;
}

areabtn =addEventListener('click',areaOfCrc);
