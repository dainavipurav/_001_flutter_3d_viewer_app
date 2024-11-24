let scene, camera, renderer;

scene = new THREE.Scene();
camera = new THREE.PerspectiveCamera(20, window.innerWidth / window.innerHeight, 1, 2000);
camera.position.z = 250;


const rightDirectionalLight = new THREE.DirectionalLight(0xffffff, 0.5);
rightDirectionalLight.position.set(10, 0, 0).normalize(); // Direction: Top-right
scene.add(rightDirectionalLight);

// Left directional light
const leftDirectionalLight = new THREE.DirectionalLight(0xffffff, 0.5);
leftDirectionalLight.position.set(-10, 0, 0).normalize(); // Direction: Top-left
scene.add(leftDirectionalLight);

const upDirectionalLight = new THREE.DirectionalLight(0xffffff, 0.5);
upDirectionalLight.position.set(0, 10, 0).normalize(); // Direction: Top-left
scene.add(upDirectionalLight);


const bottomDirectionalLight = new THREE.DirectionalLight(0xffffff, 0.5);
bottomDirectionalLight.position.set(0, -10, 0).normalize(); // Direction: Top-left
scene.add(bottomDirectionalLight);

const frontDirectionalLight = new THREE.DirectionalLight(0xffffff, 0.5);
frontDirectionalLight.position.set(0, 0, 10).normalize(); // Direction: Top-left
scene.add(frontDirectionalLight);


const backDirectionalLight = new THREE.DirectionalLight(0xffffff, 0.5);
backDirectionalLight.position.set(0, 0, -10).normalize(); // Direction: Top-left
scene.add(backDirectionalLight);


// Load MTL and OBJ files
var gltfLoader = new THREE.GLTFLoader();
gltfLoader.load('models/city.glb', function (gltf) {
    scene.add( gltf.scene );
});

// Set up the renderer
renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.setClearColor(0xccccff);
document.body.appendChild(renderer.domElement);

// Set up the orbit controls
const controls = new THREE.OrbitControls(camera, renderer.domElement);
controls.addEventListener('change', renderer);

// Animation function
function animate() {
    requestAnimationFrame(animate);

    // Optional: Rotate the model for animation
    // scene.traverse((child) => {
    //     if (child instanceof THREE.Mesh) {
    //         child.rotation.z += 0.01;
    //     }
    // });

    renderer.render(scene, camera);
}

animate();
