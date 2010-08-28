class Admin::InfoController < AdminController
    uses_yui_editor
  include Geokit::Geocoders
  
  def show
    @info = Info.find(1)
  end

  def edit
    @info = Info.find(1)
     @address = @info.address

        @location = MultiGeocoder.geocode(@address)
        if @location.success
         lat = @location.lat
         lng = @location.lng
        end

        @map = GMap.new("map_div")
        @map.control_init(:large_map => true, :map_type => true)
        @map.center_zoom_init([lat,lng], 13)

        ianazones = GMarker.new([lat,lng])
        @map.overlay_init(ianazones)
  end

end