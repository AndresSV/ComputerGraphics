var canvas = document.getElementById("canvas");

canvas.height = 570;
canvas.width = 570;

var gl = canvas.getContext("webgl2");

gl.clearColor(1.0, 1.0, 1.0, 1.0);

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
    col = vec4(0.392, 0.254, 0.643, 1.0);
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

var points = [     0.0,  0.7071,
                0.6725,  0.2185,
                0.4156, -0.5721,
               -0.4156, -0.5721,
               -0.6725,  0.2185,
                   0.0,  0.7071,
            ];

gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(points), gl.STATIC_DRAW);

gl.bindBuffer(gl.ARRAY_BUFFER, null);

gl.useProgram(program);

var position = gl.getAttribLocation(program, 'pos');

gl.enableVertexAttribArray(position);

gl.bindBuffer(gl.ARRAY_BUFFER, buffer)

gl.vertexAttribPointer(position, 2, gl.FLOAT, false, 0, 0);

gl.drawArrays(gl.LINE_STRIP, 0, 6);