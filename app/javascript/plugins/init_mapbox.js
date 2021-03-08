import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';


const initMapbox = () => {
  const mapElement = document.getElementById('map');
  

  if (mapElement) { // only build a map if there's a div#map to inject 
    console.log('created directions')
    var directions = new MapboxDirections({
      accessToken: mapElement.dataset.mapboxApiKey,
      unit: 'metric',
      profile: 'mapbox/walking'
    });

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    // Creating the map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/marianaapm/ckltkt6s32jgo17o4jhqusk5z'
    });
    // Add search input to the map
 
    if (mapElement.dataset.route === 'show') {
          console.log('checked show routes')
          map.addControl(new MapboxDirections({
          accessToken: mapboxgl.accessToken,
          interactive: false,
          controls: { instructions: false, profileSwitcher: false }
        }));
    } else {
      console.log('not show')
      map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl }));

         // Adding markers to the map
      addMarkersToMap(map, markers);
        console.log(markers)
      if (mapElement.dataset.umarker) {
        const umarker = JSON.parse(mapElement.dataset.umarker);
        console.log(umarker)
        if (umarker.lng !== null) {
          addUserMarkerToMap(map, umarker);
          // Zoom map to markers
          fitMapToUMarker(map, umarker);
        } else {
          fitMapToMarkers(map, markers);
        }
      }
    }


    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition((position) => {
        console.log('geolocation')
        
        const current_lat = position.coords.latitude;
        const current_lng = position.coords.longitude;

        setTimeout(1000);

        map.on('load', () => {
          console.log('load directions')
          directions.setOrigin([current_lng, current_lat]); 
          directions.setDestination([markers[0].lng, markers[0].lat]); 
        });
        
      });
    } else {
      alert("I'm sorry, but geolocation services are not supported by your browser.");
    }
    
  }
};

const addMarkersToMap = (map, markers) => {
  console.log('adding markers')
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';
    
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const addUserMarkerToMap = (map, umarker) => {
  const popup = new mapboxgl.Popup().setHTML(umarker.infoWindow);
  const userElement = document.createElement('div');
  userElement.className = 'umarker';
  userElement.style.backgroundImage = `url('${umarker.image_url}')`;
  userElement.style.backgroundSize = 'contain';
  userElement.style.width = '27px';
  userElement.style.height = '35px';

  new mapboxgl.Marker(userElement)
  .setLngLat([ umarker.lng, umarker.lat ])
  .setPopup(popup) // add this
  .addTo(map);
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const fitMapToUMarker = (map, umarker) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ umarker.lng, umarker.lat ]);
  map.fitBounds(bounds, { padding: 20, maxZoom: 13, duration: 1000 });
  
};

// const checkExist = () => { 
//   const myInterval = setInterval(() => {
//   const elements = document.querySelectorAll('markers');
//   if (elements) {
//     clearInterval(myInterval);
//     }
//   }, 30);
// };


export { initMapbox };