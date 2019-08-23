import "bootstrap";
import 'bootstrap4-toggle';
import 'bootstrap4-toggle/css/bootstrap4-toggle.min.css'
import { listenCheck } from "./modal";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import '../plugins/flatpickr';
import { initAutocomplete } from '../plugins/init_autocomplete';

initMapbox();
initAutocomplete();
listenCheck();
