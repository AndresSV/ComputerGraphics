var canvas = document.getElementById("canvas");

canvas.height = 570;
canvas.width = 570;

var gl = canvas.getContext("webgl2");

gl.clearColor(0.93, 0.07, 0.19, 1.0);

gl.clear(gl.DEPTH_BUFFER_BIT | gl.COLOR_BUFFER_BIT)

var vertexShader = `#version 300 es
precision mediump float;
in vec2 pos;
void main() {
    gl_Position = vec4(pos.x, pos.y, 0.0, 1.0);
}`;

var fragmentShader = `#version 300 es
precision mediump float;
out vec4 col;
void main() {
    col = vec4(0.11, 0.32, 0.64, 1.0);
}`;

var vs = gl.createShader(gl.VERTEX_SHADER);
var fs = gl.createShader(gl.FRAGMENT_SHADER);

gl.shaderSource(vs, vertexShader);
gl.shaderSource(fs, fragmentShader);
gl.compileShader(vs);
gl.compileShader(fs);

if (gl.getShaderParameter(vs, gl.COMPILE_STATUS)) {
    console.error(gl.getShaderInfoLog(vs))
}

if (gl.getShaderParameter(fs, gl.COMPILE_STATUS)) {
    console.error(gl.getShaderInfoLog(fs))
}

var program = gl.createProgram();

gl.attachShader(program, vs);
gl.attachShader(program, fs);
gl.linkProgram(program)

if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
    console.error(gl.getProgramInfoLog(program));
}

var buffer = gl.createBuffer();

gl.bindBuffer(gl.ARRAY_BUFFER, buffer);

var points = [];

let diameter = 1.4;
let segments = 360;

for (let i = 0; i < segments; i++) {
    let x = ( diameter / 2 ) * Math.cos( i * (2 * Math.PI / segments));
    let y = ( diameter / 2 ) * Math.sin( i * (2 * Math.PI / segments));
    points.push(y);
    points.push(x);
}

gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(points), gl.STATIC_DRAW);

gl.bindBuffer(gl.ARRAY_BUFFER, null);

gl.useProgram(program);

var position = gl.getAttribLocation(program, 'pos');

gl.enableVertexAttribArray(position);

gl.bindBuffer(gl.ARRAY_BUFFER, buffer);

gl.vertexAttribPointer(position, 2, gl.FLOAT, false, 0, 0);

gl.drawArrays(gl.TRIANGLE_FAN, 0, segments);