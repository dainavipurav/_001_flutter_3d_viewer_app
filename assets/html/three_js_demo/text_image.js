import * as THREE from '../node_modules/three/build/three.module.js';


// Create the scene
const scene = new THREE.Scene();

// Create the camera
const camera = new THREE.PerspectiveCamera(
    100,
    window.innerWidth / window.innerHeight,
    0.1,
    1000
);
camera.position.z = 5;

// Create the renderer
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

// Load the texture
const texture = new THREE.TextureLoader().load("textures/water.png");
texture.wrapS = THREE.RepeatWrapping;
texture.wrapT = THREE.RepeatWrapping;
texture.repeat.set(5,5);

const geometry = new THREE.PlaneGeometry(5, 5);
const material = new THREE.MeshBasicMaterial({ map: texture });
const plane = new THREE.Mesh(geometry, material);
scene.add(plane);

function animate() {
    requestAnimationFrame(animate);

    plane.rotation.y += 0.01; 
    plane.rotation.x += 0.05;
    renderer.render(scene, camera);
}

animate();
