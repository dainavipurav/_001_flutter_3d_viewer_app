let scene, camera, renderer;

// Set up the scene and camera
scene = new THREE.Scene();
camera = new THREE.PerspectiveCamera(20, window.innerWidth / window.innerHeight, 1, 2000);
camera.position.z = 250;

// Add directional lights
const addDirectionalLight = (x, y, z) => {
    const light = new THREE.DirectionalLight(0xffffff, 0.5);
    light.position.set(x, y, z).normalize();
    scene.add(light);
};
addDirectionalLight(10, 0, 0);  // Right
addDirectionalLight(-10, 0, 0); // Left
addDirectionalLight(0, 10, 0);  // Up
addDirectionalLight(0, -10, 0); // Down
addDirectionalLight(0, 0, 10);  // Front
addDirectionalLight(0, 0, -10); // Back

// Load the GLTF model
const gltfLoader = new THREE.GLTFLoader();
gltfLoader.load('models/city.glb', function (gltf) {
    scene.add(gltf.scene);
});

// Set up the renderer
renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.setClearColor(0xccccff);
document.body.appendChild(renderer.domElement);

// Set up the orbit controls
const controls = new THREE.OrbitControls(camera, renderer.domElement);
controls.addEventListener('change', () => renderer.render(scene, camera));

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



function loadFileUsingByteArray(byteArray) {
  console.log("byteArray", byteArray);
  const blob = new Blob([byteArray], {type: "application/octet-stream"});
  console.log("blob", blob);
  const url = URL.createObjectURL(blob);
  console.log("url", url);
  scene.clear();

  const gltfLoader = new THREE.GLTFLoader();
    gltfLoader.load(url, function (gltf) {
      scene.add(gltf.scene);
    }, undefined, function (error) {
      console.error('Error loading the GLTF model:', error);
    });
}

animate();
