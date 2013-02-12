require 'json'
require 'set'
data=params[:data]
adj_list=JSON.load(data)
colors=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
color_list=[-1]*adj_list.length
0.upto adj_list.length-1 do |vertex|
	adj_vertices=adj_list[vertex]
	adj_colors=[]
	adj_vertices.each do |adj|
		adj_colors.push(color_list[adj])
	end
	color_list[vertex]=(colors.to_set-adj_colors.to_set).to_a[0]
end
color_string = JSON.dump(color_list)
puts color_string
