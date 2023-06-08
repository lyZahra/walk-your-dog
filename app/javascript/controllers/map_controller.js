import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    marker: String
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      // style: "mapbox://styles/mapbox/streets-v10"
      // style: "mapbox://styles/crg1234/climxtrcl00n301r08sfb3jk1" globe version
      style: "mapbox://styles/crg1234/clin81q2h001p01p79a25bqi4"
    })

    this.#addMarkersToShowMap()
    this.#addMarketToMap
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #addMarkerToShowMap(marker) {
    const customMarker = document.createElement("div")
    customMarker.innerHTML = marker.marker_html

    new mapboxgl.Marker(customMarker)
      .setLngLat([marker.lng, marker.lat])
      .addTo(this.map)
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
