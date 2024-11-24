import * as THREE from '../node_modules/three/build/three.module.js';

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera( 100, window.innerWidth / window.innerHeight, 0.1, 1000 );

const renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );
renderer.setAnimationLoop( animate );
document.body.appendChild( renderer.domElement );

const geometry = new THREE.BoxGeometry( 2, 2, 2 );
const material = new THREE.MeshBasicMaterial( { color: 0x00ffff } );
const cube = new THREE.Mesh( geometry, material );
scene.add( cube );


const lineMaterial = new THREE.LineBasicMaterial( { color: 0xffffff } );
const points = [];
points.push( new THREE.Vector3( -10, 0, 0 ) );
points.push( new THREE.Vector3( 0, 0, 0 ) );
points.push( new THREE.Vector3( 0, 10, 0 ) );

const lineGeometry = new THREE.BufferGeometry().setFromPoints( points );
const line = new THREE.Line( lineGeometry, lineMaterial );

scene.add( line );
renderer.render( scene, camera );


camera.position.z = 5;

function animate() {
	cube.rotation.x += 0.05;
	cube.rotation.y += 0.05;

	line.rotation.x += 0.05;
	line.rotation.y += 0.05;

	renderer.render( scene, camera );
}