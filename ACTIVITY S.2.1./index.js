THREE.Cache.enabled = true;

const scene = new THREE.Scene();

const camera = new THREE.PerspectiveCamera( 55, window.innerWidth / window.innerHeight, 0.1, 1000 );

const renderer = new THREE.WebGLRenderer( { alpha: true } );

scene.background = new THREE.Color( 0x1D3354 );
renderer.setPixelRatio( window.devicePixelRatio );
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

camera.position.setZ(5);
renderer.render( scene, camera );

const loader = new THREE.FileLoader();

loader.load(
	'pyramid.obj',
    function ( data ) {
        var vertices = [];
        var faces = [];
        var lines = data.split('\n');
        for (let i = 0; i < lines.length; i++) {
            if ( lines[i][0] == 'v' ) {
                var vertex = lines[i].split(" ").filter(item => item);
                vertices.push( parseFloat( vertex[1] ), parseFloat( vertex[2] ), parseFloat( vertex[3] ) );
            } else if ( lines[i][0] == 'f' ) {
                var face = lines[i].split(" ").filter(item => item);
                faces.push( parseFloat( face[1] ), parseFloat( face[2] ), parseFloat( face[3] ) );
            }
        }
        const verticesOfPyramid = new Float32Array( vertices );
        const indicesOfFaces = new Float32Array( faces );

        const geometry = new THREE.PolyhedronGeometry( verticesOfPyramid, indicesOfFaces, 3.0, 2 );
        const material = new THREE.MeshBasicMaterial( { color: 0x467599, wireframe: false } );
        const pyramid = new THREE.Mesh( geometry, material );

        geometry.translate(0,0,0);

        scene.add(pyramid);

        function animate() {
            requestAnimationFrame( animate );

            pyramid.rotation.x += 0.01;
            pyramid.rotation.y += 0.01;

            renderer.render( scene, camera );
        }
        renderer.render( scene, camera );
        // animate();

    },
    function ( xhr ) {
        console.log( (xhr.loaded / xhr.total * 100) + '% loaded' );
    },
    function ( err ) {
        console.error( err );
    }
);

