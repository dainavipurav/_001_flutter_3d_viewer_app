let scene, camera, renderer;

// Set up the scene, camera and renderer
scene = new THREE.Scene();
camera =new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
renderer = new THREE.WebGLRenderer();

loadfile('models/city.glb');

document.body.appendChild(renderer.domElement);

// Set up the orbit controls
const controls = new THREE.OrbitControls(camera, renderer.domElement);
controls.addEventListener('change', () => renderer.render(scene, camera));

animate();

// Animation function
function animate() {
  requestAnimationFrame(animate);

  renderer.render(scene, camera);
}

// Set default views
function setDefaultView(){
  // camera.position.set(0, 50, 200);
  camera.position.set(0, 1.5, 5);
  renderer.setSize(window.innerWidth, window.innerHeight);
  renderer.setClearColor(0xccccff);
}

function loadfile(filePath){
  setDefaultView();
  // Ambient Light: Provides overall light to illuminate the model
  const ambientLight = new THREE.AmbientLight(0xffffff, 0.5); // Color: White, Intensity: 0.5
  scene.add(ambientLight);
  
  // Point Light: Acts as a light source from a specific position (like a bulb)
  const pointLight = new THREE.PointLight(0xffffff, 1, 1000); // Color: White, Intensity: 1, Distance: 1000
  pointLight.position.set(50, 50, 50); // Position the light
  scene.add(pointLight);
    
  // Directional Light: Simulates sunlight, casting parallel rays
  const directionalLight = new THREE.DirectionalLight(0xffffff, 0.8); // Color: White, Intensity: 0.8
  directionalLight.position.set(-50, 100, 50); // Position the light
  directionalLight.castShadow = true; // Enable shadows if needed
  scene.add(directionalLight);
  
  // Load the GLTF model
  const gltfLoader = new THREE.GLTFLoader();
  gltfLoader.load(filePath, function (gltf) {
      scene.add(gltf.scene);
  });
}

function loadFileFromDevice(byteArray) {
  console.log("byteArray", byteArray);
  const blob = new Blob([byteArray], {type: "application/octet-stream"});
  console.log("blob", blob);
  const url = URL.createObjectURL(blob);
  console.log("url", url);
  scene.clear();

  loadfile(url);
}
