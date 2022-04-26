THREE.Cache.enabled = true;

const scene = new THREE.Scene();

const camera = new THREE.PerspectiveCamera( 55, window.innerWidth / window.innerHeight, 0.1, 1000 );

const renderer = new THREE.WebGLRenderer( { alpha: true } );

scene.background = new THREE.Color( 0x1D3354 );
renderer.setPixelRatio( window.devicePixelRatio );
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

camera.position.setX(10)
camera.position.setY(-30)
camera.position.setZ(15);
camera.lookAt(0, 0, 0);
renderer.render( scene, camera );

const loader = new THREE.FileLoader();

loader.load(
	'pyramid.obj',
    function ( data ) {
        var verticesSource = [];
        var processedVertices = [];
        var lines = data.split('\n');
        for (let i = 0; i < lines.length; i++) {
            var currentLine = lines[i].split(" ").filter(item => item);
            if ( currentLine[0] == 'v' ) {
                verticesSource.push( new Array( currentLine[1], currentLine[2], currentLine[3] ) );
            }
            if ( currentLine[0] == 'f' ) {
                console.log(currentLine)
                for (let j = 1; j < currentLine.length; j++ ) {
                    let currentFace = currentLine[j] - 1;
                    console.log(currentFace);
                    console.log('verticesSource', verticesSource[currentFace]);
                    var currentVertex = verticesSource[currentLine[j] - 1];
                    console.log('currentVertex', currentVertex);
                    console.log('iteration')
                    currentVertex.forEach( (element) => {
                        processedVertices.push( element );
                    });
                }
                
            }
        }

        console.log('verticesSource', verticesSource);
        console.log('processedVertices', processedVertices);

        const vertices = new Float32Array(processedVertices); 

        const geometry = new THREE.BufferGeometry();
        geometry.setAttribute('position', new THREE.BufferAttribute(vertices, 3));
        const material = new THREE.MeshBasicMaterial( { color: 0x467599, wireframe: false } );
        const mesh = new THREE.Mesh(geometry, material);

        geometry.translate(0,0,0);

        scene.add(mesh);

        function animate() {
            requestAnimationFrame( animate );

            mesh.rotation.x += 0.01;
            mesh.rotation.y += 0.01;
            mesh.rotation.z += 0.01;

            renderer.render( scene, camera );
        }
        renderer.render( scene, camera );
        animate();

    },
    function ( xhr ) {
        console.log( (xhr.loaded / xhr.total * 100) + '% loaded' );
    },
    function ( err ) {
        console.error( err );
    }
);