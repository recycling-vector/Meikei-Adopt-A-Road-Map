require './constants'
require 'json'

first = true
fields = nil
while gets
  r = $_.strip.split(',')
  if first 
    fields = r 
    first = false
  else
    #raise $_ unless r.size == DATA_N_FIELDS
    f = {
      :type => 'Feature',
      :geometry => {
        :type => 'Point',
        :coordinates => [
          r[2].to_f, r[1].to_f
        ]
      },
      :properties => {
      },
      :tippecanoe => {
        :layer => DATA_LAYER,
        :maxzoom => DATA_TILE_MAXZOOM,
        :minzoom => DATA_TILE_MINZOOM
      }
    }
    DATA_N_FIELDS.times {|i|
      f[:properties][fields[i]] = r[i] if r[i]
    }
    print "\x1e#{JSON.dump(f)}\n"
  end
end
