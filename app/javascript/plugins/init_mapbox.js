import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';


const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject 
  
    const directions = new MapboxDirections({
      accessToken: mapElement.dataset.mapboxApiKey,
      unit: 'metric',
      profile: 'mapbox/walking'
    });

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    // Creating the map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/marianaapm/ckltkt6s32jgo17o4jhqusk5z'
    });
    // Add search input to the map
 
    if (mapElement.dataset.route === 'show') {
          map.addControl(new MapboxDirections({
          accessToken: mapboxgl.accessToken,
          interactive: false,
          controls: { instructions: false, profileSwitcher: false }
        }));
    } else {
      map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl }));
    }


    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition((position) => {
        
        const current_lat = position.coords.latitude;
        const current_lng = position.coords.longitude;
        
        map.on('load', () => {
          directions.setOrigin([current_lng, current_lat]); 
          directions.setDestination([markers[0].lng, markers[0].lat]); 
        });
        
      });
    } else {
      alert("I'm sorry, but geolocation services are not supported by your browser.");
    }
    
    // Adding markers to the map
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    // Zoom map to markers
    fitMapToMarkers(map, markers);
  }
};

const addMarkersToMap = (map, markers) => {
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

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};


export { initMapbox };